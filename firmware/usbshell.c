// Based on part of the ukhasnet dongle project
// (c) Jon Sowman 2015 <jon+github@jonsowman.com>

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "ch.h"
#include "hal.h"
#include "hal_channels.h"

#include "shell.h"
#include "chprintf.h"

#include "shell.h"
#include "usbshell.h"
#include "config.h"

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
    (void)argc;
    (void)argv;
    chprintf(chp, "Version: %s\r\n", FW_VERSION);
}

// load command: Load config from flash, overwriting config in memory
static void cmd_load(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argc;
    (void)argv;
    if(config_load())
        chprintf(chp, "Config loaded successfully.");
    else
        chprintf(chp, "Config invalid or missing.");
}

// save command: Save config in memory to flash
static void cmd_save(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argc;
    (void)argv;
    config_save();
    chprintf(chp, "Config saved.");
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
    chprintf(chp, "\r\n");

    chprintf(chp, "ntp_server1....... %s\r\n", bigtime_config.ntp_server1);
    chprintf(chp, "ntp_server2....... %s\r\n", bigtime_config.ntp_server2);
    chprintf(chp, "ntp_server3....... %s\r\n", bigtime_config.ntp_server3);
    chprintf(chp, "ntp_interval...... %u minutes\r\n",
             bigtime_config.ntp_interval);
    chprintf(chp, "\r\n");

    chprintf(chp, "disp_flash_second. %s\r\n",
             bigtime_config.disp_flash_second ? "true" : "false");
    chprintf(chp, "disp_sync......... %s\r\n",
             bigtime_config.disp_sync ? "true" : "false");
    chprintf(chp, "disp_has_seconds.. %s\r\n",
             bigtime_config.disp_has_seconds ? "true" : "false");
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
    else if(strcmp(argv[0], "ntp_server1") == 0)
        strncpy(bigtime_config.ntp_server1, argv[1], MAX_FQDN_LEN);
    else if(strcmp(argv[0], "ntp_server2") == 0)
        strncpy(bigtime_config.ntp_server2, argv[1], MAX_FQDN_LEN);
    else if(strcmp(argv[0], "ntp_server3") == 0)
        strncpy(bigtime_config.ntp_server3, argv[1], MAX_FQDN_LEN);
    else if(strcmp(argv[0], "ntp_interval") == 0)
        bigtime_config.ntp_interval = atoi(argv[1]);
    else if(strcmp(argv[0], "disp_flash_second") == 0)
        bigtime_config.disp_flash_second = deformat_bool(chp, argv[1]);
    else if(strcmp(argv[0], "disp_sync") == 0)
        bigtime_config.disp_sync = deformat_bool(chp, argv[1]);
    else if(strcmp(argv[0], "disp_has_seconds") == 0)
        bigtime_config.disp_has_seconds = deformat_bool(chp, argv[1]);
    else if(strcmp(argv[0], "disp_auto_bst") == 0)
        bigtime_config.disp_auto_bst = deformat_bool(chp, argv[1]);
}


static const ShellCommand commands[] = {
    {"mem", cmd_mem},
    {"threads", cmd_threads},
    {"version", cmd_version},
    {"load", cmd_load},
    {"save", cmd_save},
    {"show", cmd_show},
    {"set", cmd_set},
    {NULL, NULL}
};

const ShellConfig shell_cfg1 = {
    (BaseSequentialStream *)&SDU1,
    commands
};

