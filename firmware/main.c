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
#include "usb.h"
#include "config.h"

static THD_WORKING_AREA(waUsbSer, 0x100);

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

    bigtime_config.net_dhcp_enable = true;

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

    // Start USB config shell
    chThdCreateStatic(waUsbSer, sizeof(waUsbSer), NORMALPRIO, UsbSerThread,
                      NULL);

    display_init();
    while(1)
    {
        for(int i=0; i<10; i++)
        {
            struct BCDTime faketime;
            faketime.st = i;
            display_time(&faketime, true);
            chThdSleepMilliseconds(1000);
        }
    }

//        uint64_t ntpDateTime;
//        int result = get_ntp_timestamp("pool.ntp.org", &ntpDateTime);
//        if(result == SNTP_SUCCESS)
//        {
//            RTCDateTime rtcDateTime;
//            rtc_from_ntp(&rtcDateTime, ntpDateTime);
//            rtc_set(&rtcDateTime);
//        }
//        struct BCDTime bcdTime;
//        rtc_get_bcd(&bcdTime);
//        display_time(&bcdTime, false);
//    }

//  /* Main thread is done now and can sleep forever. */
//    chThdSleep(TIME_INFINITE);
//
//    /* In case idle thread is disabled */
//    while(1);
}
