#include <string.h>

#include "ch.h"
#include "hal.h"

#include "chprintf.h"
#include "shell.h"

#include "lwipthread.h"

#include "lwip/opt.h"
#include "lwip/arch.h"
#include "lwip/api.h"
#include "lwip/dns.h"
#include "lwip/netif.h"

#include "rom.h"
#include "rtc.h"
#include "display.h"
#include "sntp.h"
#include "config.h"
#include "usbshell.h"

static THD_WORKING_AREA(waUsbSer, 0x100);
static THD_WORKING_AREA(waDisplay, 0x100);

/* On hard fault, copy HARDFAULT_PSP to the sp reg so gdb can give a trace */
void **HARDFAULT_PSP;
register void *stack_pointer asm("sp");
void HardFault_Handler(void) {
    asm("mrs %0, psp" : "=r"(HARDFAULT_PSP) : :);
    stack_pointer = HARDFAULT_PSP;
    while(1);
}

int main(void) {
    uint8_t mac_addr[6];
    struct ip_addr address, netmask, gateway;
    IP4_ADDR(&address, 0, 0, 0, 0);
    IP4_ADDR(&netmask, 255, 255, 255, 255);
    IP4_ADDR(&gateway, 0, 0, 0, 0);
    lwipthread_opts_t lwipopts = {
        .macaddress = mac_addr,
        .address = address.addr,
        .netmask = netmask.addr,
        .gateway = gateway.addr,
    };

    /* Initialise ChibiOS */
    halInit();
    chSysInit();

    // Blank the display:
    display_init();

    /* Read our MAC address from the EEPROM */
    rom_get_eui48(mac_addr);

    // Load config from flash
    config_load();

    // If not using DHCP, set details from config:
    if(!bigtime_config.net_dhcp_enable)
    {
        lwipopts.address = bigtime_config.net_static_ip.addr;
        lwipopts.netmask = bigtime_config.net_static_netmask.addr;
        lwipopts.gateway = bigtime_config.net_static_gateway.addr;
        dns_setserver(0, &bigtime_config.net_static_dns1);
        dns_setserver(1, &bigtime_config.net_static_dns2);
    }

    /* Initialise lwIP (automatically does DHCP if ip == 0.0.0.0) */
    lwipInit(&lwipopts);
    netif_set_hostname(netif_default, "bigtime");

    // Initialise the state structure
    memset(&bigtime_state, 0, sizeof(bigtime_state));

    // Force sync on boot:
    bigtime_state.force_sync = true;

    // Start USB config shell and display thread
    chThdCreateStatic(waUsbSer, sizeof(waUsbSer), NORMALPRIO, UsbSerThread,
            NULL);
    chThdCreateStatic(waDisplay, sizeof(waDisplay), NORMALPRIO, DisplayThread,
            NULL);


    uint64_t ntpDateTime;
    RTCDateTime rtcDateTime;
    while(true)
    {
        bigtime_state.syncing = true;

        // Poll the NTP servers until we successfully sync.
        while(true)
        {
            if(get_ntp_timestamp(bigtime_config.ntp_server1, &ntpDateTime)
                    == SNTP_SUCCESS)
                break;

            if(get_ntp_timestamp(bigtime_config.ntp_server2, &ntpDateTime)
                    == SNTP_SUCCESS)
                break;

            if(get_ntp_timestamp(bigtime_config.ntp_server3, &ntpDateTime)
                    == SNTP_SUCCESS)
                break;

            // If none of the servers respond, wait for a period before trying
            // again.  On cold boot or force sync, wait 5s, otherwise wait 5
            // minutes
            if(bigtime_state.force_sync)
                chThdSleepMilliseconds(5 * 1000);
            else
                for(int i=0; i<5*60; i++)
                    if(bigtime_state.force_sync)
                        break;
                    else
                        chThdSleepMilliseconds(1000);
        }

        // Set the RTC from the NTP response.
        rtc_from_ntp(&rtcDateTime, ntpDateTime);
        rtc_set(&rtcDateTime);
        bigtime_state.syncing = false;

        // Set time last synced to rtcDateTime
        bigtime_state.last_synced = rtcDateTime;

        // And reset the force_sync flag.
        bigtime_state.force_sync = false;

        // Pause here otherwise we accidentally sync several times
        chThdSleepMilliseconds(3000);

        // And wait until it's time for our next sync
        while(true)
        {
            rtcGetTime(&RTCD1, &rtcDateTime);
            if(bigtime_state.force_sync)
                break;

            // Millisecond-of-day of sync time:
            uint32_t sync_millisecond = 0;
            sync_millisecond += bigtime_config.ntp_sync_time / 100 * 3600000u;
            sync_millisecond += (bigtime_config.ntp_sync_time % 100) * 60000u;

            // If last sync was on a different day to today:
            if((bigtime_state.last_synced.year != rtcDateTime.year) ||
               (bigtime_state.last_synced.month != rtcDateTime.month) ||
               (bigtime_state.last_synced.day != rtcDateTime.day))
            {
                // If time-of-day is after the sync time:
                if(rtcDateTime.millisecond > sync_millisecond)
                    break;  // Sync
            }
            else
                // Last sync was today.
                if(bigtime_state.last_synced.millisecond <= sync_millisecond
                    && rtcDateTime.millisecond > sync_millisecond)
                    break;  // Sync

            chThdSleepMilliseconds(1000);
        }
    }
}
