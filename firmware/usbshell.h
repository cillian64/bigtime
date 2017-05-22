// Based on part of the ukhasnet dongle project
// (c) Jon Sowman 2015 <jon+github@jonsowman.com>

#ifndef __SHELL_H_
#define __SHELL_H_

#include "ch.h"
#include "hal.h"

extern const ShellConfig shell_cfg1;
extern SerialUSBDriver SDU1;
THD_FUNCTION(UsbSerThread, arg);

#endif

