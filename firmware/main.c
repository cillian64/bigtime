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

#include "rom.h"
#include "display.h"
#include "rtc.h"
#include "sntp.h"


int main(void) {
    /* Set up our IP details */
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

    /* Initialise lwIP using the new MAC address */
    lwipInit(&lwipopts);

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
