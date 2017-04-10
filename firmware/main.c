#include <string.h>

#include "ch.h"
#include "hal.h"
#include "ch_test.h"

#include "chprintf.h"
#include "shell.h"

#include "lwipthread.h"

#include "lwip/opt.h"
#include "lwip/arch.h"
#include "lwip/api.h"
#include "lwip/dns.h"

#include "rom.h"
#include "display.h"
#include "rtc.h"
#include "sntp.h"
#include "usb.h"
#include "config.h"

static THD_WORKING_AREA(waUsbSer, 0x100);

int main(void) {
    uint8_t mac_addr[6];
    lwipthread_opts_t lwipopts;
    lwipopts.macaddress = mac_addr; // Pointer to array, set layer

    /* Initialise ChibiOS */
    halInit();
    chSysInit();

    /* Read our MAC address from the EEPROM */
    rom_get_eui48(mac_addr);

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

    // Start USB config shell
    chThdCreateStatic(waUsbSer, sizeof(waUsbSer), NORMALPRIO, UsbSerThread,
                      NULL);

    while(1)
    {
        uint64_t ntpDateTime;
        int result = get_ntp_timestamp("pool.ntp.org", &ntpDateTime);
        if(result == SNTP_SUCCESS)
        {
            RTCDateTime rtcDateTime;
            rtc_from_ntp(&rtcDateTime, ntpDateTime);
            rtc_set(&rtcDateTime);
        }
        struct BCDTime bcdTime;
        rtc_get_bcd(&bcdTime);
        display_time(&bcdTime, false);
    }

//  /* Main thread is done now and can sleep forever. */
//    chThdSleep(TIME_INFINITE);
//
//    /* In case idle thread is disabled */
//    while(1);
}
