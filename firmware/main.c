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

#include "rom.h"
#include "rtc.h"
#include "display.h"
#include "sntp.h"
#include "config.h"
#include "usbshell.h"

static THD_WORKING_AREA(waUsbSer, 0x100);
static THD_WORKING_AREA(waDisplay, 0x100);

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

    // Initialise the state structure
    memset(&bigtime_state, 0, sizeof(bigtime_state));

    // Start USB config shell and display thread
    chThdCreateStatic(waUsbSer, sizeof(waUsbSer), NORMALPRIO, UsbSerThread,
            NULL);
    chThdCreateStatic(waDisplay, sizeof(waDisplay), NORMALPRIO, DisplayThread,
            NULL);


    while(1)
    {
        uint64_t ntpDateTime;
        int result = SNTP_UNKNOWN;

        bigtime_state.syncing = true;

        // Poll every 2s until we successfully sync to NTP.
        while(result != SNTP_SUCCESS)
        {
            result = get_ntp_timestamp(bigtime_config.ntp_server1,
                                           &ntpDateTime);
            chThdSleepMilliseconds(2000);
        }

        // Set the RTC from the NTP response.
        RTCDateTime rtcDateTime;
        rtc_from_ntp(&rtcDateTime, ntpDateTime);
        rtc_set(&rtcDateTime);

        bigtime_state.syncing = false;
        // And wait until it's time for our next sync
        for(int i=0; i < bigtime_config.ntp_interval * 60; i++)
        {
            chThdSleepMilliseconds(1000);
            if(bigtime_state.force_sync)
            {
                bigtime_state.force_sync = false;
                break;
            }
        }
    }
}
