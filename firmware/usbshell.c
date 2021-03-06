// Based on part of the ukhasnet dongle project
// (c) Jon Sowman 2015 <jon+github@jonsowman.com>

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "ch.h"
#include "hal.h"
#include "hal_channels.h"
#include "hal_rtc.h"

#include "shell.h"
#include "chprintf.h"

#include "shell.h"
#include "usbshell.h"
#include "usbcfg.h"
#include "config.h"
#include "rtc.h"
#include "sntp.h"

#include <lwip/netif.h>
#include <lwip/dns.h>

/*===========================================================================*/
/* Shell commands.                                                           */
/*===========================================================================*/

// Show memory status, core and heap. (by Adam Greig)
static void cmd_mem(BaseSequentialStream *chp, int argc, char *argv[]) {
    size_t n, size, largestp;

    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: mem\r\n");
        return;
    }
    n = chHeapStatus(NULL, &size, &largestp);
    chprintf(chp, "core free memory  : %u bytes\r\n", chCoreGetStatusX());
    chprintf(chp, "heap fragments    : %u\r\n", n);
    chprintf(chp, "heap free total   : %u bytes\r\n", size);
    chprintf(chp, "largest free block: %u bytes\r\n", largestp);
}

// Show details of threads. (by Adam Greig)
static void cmd_threads(BaseSequentialStream *chp, int argc, char *argv[]) {
  static const char *states[] = {CH_STATE_NAMES};
  uint64_t busy = 0, total = 0;
  thread_t *tp;

  (void)argv;
  if (argc > 0) {
    chprintf(chp, "Usage: threads\r\n");
    return;
  }

  chprintf(chp,
    "name        |addr    |prio|refs|state    |time\r\n");
  chprintf(chp,
    "------------|--------|----|----|---------|--------\r\n");
  tp = chRegFirstThread();
  do {
    chprintf(chp, "%12s|%.8lx|%.8lx|%4lu|%4lu|%4lu|%9s|%lu\r\n",
            chRegGetThreadNameX(tp), (uint32_t)tp->wabase,
            (uint32_t)tp->prio, (uint32_t)(tp->refs - 1),
            states[tp->state], (uint32_t)tp->time);
    if(tp->prio != 1) {
        busy += tp->time;
    }
    total += tp->time;
    tp = chRegNextThread(tp);
  } while (tp != NULL);
  chprintf(chp, "CPU Usage: %ld%%\r\n", busy*100/total);
}

// version command: Shows git tag, commit and dirty status
// (git describe --abbrev=8 --always --dirty, via Makefile GITVERSION)
static void cmd_version(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: version\r\n");
        return;
    }
    chprintf(chp, "Version: %s\r\n", FW_VERSION);
}

// load command: Load config from flash, overwriting config in memory
static void cmd_load(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: load\r\n");
        return;
    }
    if(config_load())
        chprintf(chp, "Config loaded successfully.\r\n");
    else
        chprintf(chp, "Config invalid or missing.\r\n");
}

// save command: Save config in memory to flash
static void cmd_save(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: save\r\n");
        return;
    }
    config_save();
    chprintf(chp, "Config saved.\r\n");
}

// netinfo command: Display networking details from DHCP
static void cmd_netinfo(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: netinfo\r\n");
        return;
    }
    struct netif *myif = netif_default;
    ip_addr_t dns1 = dns_getserver(0), dns2 = dns_getserver(1);
    chprintf(chp, "IP address..... %s\r\n", ipaddr_ntoa(&myif->ip_addr));
    chprintf(chp, "Network mask... %s\r\n", ipaddr_ntoa(&myif->netmask));
    chprintf(chp, "Gateway........ %s\r\n", ipaddr_ntoa(&myif->gw));
    chprintf(chp, "DNS server 1... %s\r\n", ipaddr_ntoa(&dns1));
    chprintf(chp, "DNS server 2... %s\r\n", ipaddr_ntoa(&dns2));
}

// Print a RTCDateTime like YYYY-MM-DD HH:MM:SS.ssss\n
static void format_rtcdatetime(BaseSequentialStream *chp,
                               RTCDateTime *rtcDateTime,
                               const char* tz)
{
    chprintf(chp, "%04u-%02u-%02u %02u:%02u:%02u %s\n",
             rtcDateTime->year + 1980, rtcDateTime->month, rtcDateTime->day,
             rtcDateTime->millisecond / 3600000,
             (rtcDateTime->millisecond % 3600000) / 60000,
             (rtcDateTime->millisecond % 60000) / 1000,
             tz);
}

// status: Show current system status (ie print state struct)
static void cmd_status(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: status\r\n");
        return;
    }
    chprintf(chp, "NTP syncing............ %s\r\n",
            bigtime_state.syncing ? "Yes" : "No");
    chprintf(chp, "Last successful sync... ");
    format_rtcdatetime(chp, &bigtime_state.last_synced, "UTC");
}

// datetime: Show datetime: YYYY-MM-DD HH:MM:SS.ssss
static void cmd_datetime(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: datetime\r\n");
        return;
    }
    RTCDateTime rtcDateTime;
    rtcGetTime(&RTCD1, &rtcDateTime);
    chprintf(chp, "RTC time: ");
    format_rtcdatetime(chp, &rtcDateTime, "UTC");
    const char* local_tz = "GMT";
    if(bigtime_config.disp_auto_bst && is_bst(&rtcDateTime))
    {
        uint64_t ntpDateTime = ntp_from_rtc(&rtcDateTime);
        ntpDateTime += (uint64_t)3600 << 32;
        rtc_from_ntp(&rtcDateTime, ntpDateTime);
        local_tz = "BST";
    }
    chprintf(chp, "Local: ");
    format_rtcdatetime(chp, &rtcDateTime, local_tz);
}

// epoch: Show epoch time, seconds since 1900-01-01 00:00:00
static void cmd_epoch(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: epoch\r\n");
        return;
    }
    RTCDateTime rtcDateTime;
    rtcGetTime(&RTCD1, &rtcDateTime);
    uint64_t ntpDateTime = ntp_from_rtc(&rtcDateTime);
    chprintf(chp, "%u.%03u\n", ntpDateTime >> 32,
             ((ntpDateTime & 0xffffffff) * 1000) >> 32);
}

// reboot: Reboot the system, useful for applying network changes
static void cmd_reboot(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: reboot\r\n");
        return;
    }
    NVIC_SystemReset();
}

// sync: Force an immediate NTP synchronisation attempt
static void cmd_sync(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
        chprintf(chp, "Usage: sync\r\n");
        return;
    }
    bigtime_state.force_sync = true;
}

// show command: Display current config (in memory)
static void cmd_show(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if (argc > 0) {
      chprintf(chp, "Usage: show\r\n");
      return;
    }
    chprintf(chp, "net_dhcp_enable... %s\r\n",
             bigtime_config.net_dhcp_enable ? "true" : "false");
    chprintf(chp, "net_static_ip..... %s\r\n",
             ipaddr_ntoa(&bigtime_config.net_static_ip));
    chprintf(chp, "net_static_netmask %s\r\n",
             ipaddr_ntoa(&bigtime_config.net_static_netmask));
    chprintf(chp, "net_static_gateway %s\r\n",
             ipaddr_ntoa(&bigtime_config.net_static_gateway));
    chprintf(chp, "net_static_dns1... %s\r\n",
             ipaddr_ntoa(&bigtime_config.net_static_dns1));
    chprintf(chp, "net_static_dns2... %s\r\n",
             ipaddr_ntoa(&bigtime_config.net_static_dns2));
    chprintf(chp, "net_hostname...... %s\r\n", bigtime_config.net_hostname);
    chprintf(chp, "\r\n");

    chprintf(chp, "ntp_server1....... %s\r\n", bigtime_config.ntp_server1);
    chprintf(chp, "ntp_server2....... %s\r\n", bigtime_config.ntp_server2);
    chprintf(chp, "ntp_server3....... %s\r\n", bigtime_config.ntp_server3);
    chprintf(chp, "ntp_sync_time..... %04u UTC\r\n",
            bigtime_config.ntp_sync_time);
    chprintf(chp, "\r\n");

    chprintf(chp, "disp_sync......... %s\r\n",
             bigtime_config.disp_sync ? "true" : "false");
    chprintf(chp, "disp_auto_bst..... %s\r\n",
             bigtime_config.disp_auto_bst ? "true" : "false");
}

// Decode "true" or "false" to a bool. Others print error and return false
static bool deformat_bool(BaseSequentialStream *chp, char *val)
{
    if(strcmp(val, "true") == 0)
        return true;
    else if(strcmp(val, "false") == 0)
        return false;
    chprintf(chp, "Invalid bool value '%s'\r\n", val);
    return false;
}

// Print the day of week, i.e. "Monday"
static void cmd_dow(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argv;
    if(argc != 0) {
        chprintf(chp, "Usage: dow\t\n");
        return;
    }
    RTCDateTime rtcDateTime;
    rtcGetTime(&RTCD1, &rtcDateTime);
    switch(rtcDateTime.dayofweek) {
        case RTC_DAY_MONDAY:
            chprintf(chp, "Monday\r\n");
            break;
        case RTC_DAY_TUESDAY:
            chprintf(chp, "Tuesday\r\n");
            break;
        case RTC_DAY_WEDNESDAY:
            chprintf(chp, "Wednesday\r\n");
            break;
        case RTC_DAY_THURSDAY:
            chprintf(chp, "Thursday\r\n");
            break;
        case RTC_DAY_FRIDAY:
            chprintf(chp, "Friday\r\n");
            break;
        case RTC_DAY_SATURDAY:
            chprintf(chp, "Saturday\r\n");
            break;
        case RTC_DAY_SUNDAY:
            chprintf(chp, "Sunday\r\n");
            break;
        default:
            chprintf(chp, "Caturday\r\n");
            break;
    }
}


// set command: Set configuration items in memory
static void cmd_set(BaseSequentialStream *chp, int argc, char *argv[]) {
    if(argc != 2) {
        chprintf(chp, "Usage: set <item> <value>\r\n");
        return;
    }
    if(strcmp(argv[0], "net_dhcp_enable") == 0)
        bigtime_config.net_dhcp_enable = deformat_bool(chp, argv[1]);
    else if(strcmp(argv[0], "net_static_ip") == 0)
        ipaddr_aton(argv[1], &bigtime_config.net_static_ip);
    else if(strcmp(argv[0], "net_static_netmask") == 0)
        ipaddr_aton(argv[1], &bigtime_config.net_static_netmask);
    else if(strcmp(argv[0], "net_static_gateway") == 0)
        ipaddr_aton(argv[1], &bigtime_config.net_static_gateway);
    else if(strcmp(argv[0], "net_static_dns1") == 0)
        ipaddr_aton(argv[1], &bigtime_config.net_static_dns1);
    else if(strcmp(argv[0], "net_static_dns2") == 0)
        ipaddr_aton(argv[1], &bigtime_config.net_static_dns2);
    else if(strcmp(argv[0], "net_hostname") == 0)
        strncpy(bigtime_config.net_hostname, argv[1], MAX_FQDN_LEN);

    else if(strcmp(argv[0], "ntp_server1") == 0)
        strncpy(bigtime_config.ntp_server1, argv[1], MAX_FQDN_LEN);
    else if(strcmp(argv[0], "ntp_server2") == 0)
        strncpy(bigtime_config.ntp_server2, argv[1], MAX_FQDN_LEN);
    else if(strcmp(argv[0], "ntp_server3") == 0)
        strncpy(bigtime_config.ntp_server3, argv[1], MAX_FQDN_LEN);
    else if(strcmp(argv[0], "ntp_sync_time") == 0)
        bigtime_config.ntp_sync_time = atoi(argv[1]);

    else if(strcmp(argv[0], "disp_sync") == 0)
        bigtime_config.disp_sync = deformat_bool(chp, argv[1]);
    else if(strcmp(argv[0], "disp_auto_bst") == 0)
        bigtime_config.disp_auto_bst = deformat_bool(chp, argv[1]);
    else
        chprintf(chp, "Unknown setting `%s`\r\n", argv[0]);
}


static const ShellCommand commands[] = {
    {"mem", cmd_mem},
    {"threads", cmd_threads},
    {"version", cmd_version},
    {"load", cmd_load},
    {"save", cmd_save},
    {"show", cmd_show},
    {"set", cmd_set},
    {"netinfo", cmd_netinfo},
    {"status", cmd_status},
    {"sync", cmd_sync},
    {"datetime", cmd_datetime},
    {"epoch", cmd_epoch},
    {"reboot", cmd_reboot},
    {"dow", cmd_dow},
    {NULL, NULL}
};

const ShellConfig shell_cfg1 = {
    (BaseSequentialStream *)&SDU1,
    commands
};

/**
 * Main thread for the USB Serial module. Start the USB serial driver and spawn
 * a shell using it. The shell is killed if the USB connection becomes
 * inactive, and is spawned again when it becomes active.
 */
THD_FUNCTION(UsbSerThread, arg)
{
    (void)arg;
    thread_t *shelltp = NULL;

    /*
     * Initializes a serial-over-USB CDC driver.
     */
    sduObjectInit(&SDU1);
    sduStart(&SDU1, &serusbcfg);

    /*
     * Activates the USB driver and then the USB bus pull-up on D+.
     * Note, a delay is inserted in order to not have to disconnect the cable
     * after a reset.
     */
    usbDisconnectBus(serusbcfg.usbp);
    chThdSleepMilliseconds(1000);
    usbStart(serusbcfg.usbp, &usbcfg);
    usbConnectBus(serusbcfg.usbp);

    /*
     * Shell manager initialization.
     */
    shellInit();
    while (true) {
        if (!shelltp && (SDU1.config->usbp->state == USB_ACTIVE))
            shelltp = chThdCreateFromHeap(NULL,
                    THD_WORKING_AREA_SIZE(2048), "shell",
                    NORMALPRIO, shellThread, (void*)&shell_cfg1);
        else if (chThdTerminatedX(shelltp)) {
            chThdRelease(shelltp);    /* Recovers memory of the previous shell.   */
            shelltp = NULL;           /* Triggers spawning of a new shell.        */
        }
        chThdSleepMilliseconds(1000);
    }
}

