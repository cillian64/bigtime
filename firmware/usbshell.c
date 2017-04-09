// Based on part of the ukhasnet dongle project
// (c) Jon Sowman 2015 <jon+github@jonsowman.com>

#include <stdio.h>
#include <string.h>

#include "ch.h"
#include "hal.h"
#include "hal_channels.h"

#include "shell.h"
#include "chprintf.h"

#include "shell.h"
#include "usbshell.h"

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

// ver command: Shows git tag, commit and dirty status
// (git describe --abbrev=8 --always --dirty, via Makefile GITVERSION)
static void cmd_ver(BaseSequentialStream *chp, int argc, char *argv[]) {
    (void)argc;
    (void)argv;
    chprintf(chp, "Version: %s\r\n", FW_VERSION);
}

static const ShellCommand commands[] = {
    {"mem", cmd_mem},
    {"threads", cmd_threads},
    {"ver", cmd_ver},
    {NULL, NULL}
};

const ShellConfig shell_cfg1 = {
    (BaseSequentialStream *)&SDU1,
    commands
};

