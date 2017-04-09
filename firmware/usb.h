// Based on part of the ukhasnet dongle project
// (c) Jon Sowman 2015 <jon+github@jonsowman.com>

#ifndef __USB_H__
#define __USB_H__

#include "ch.h"
#include "hal.h"

SerialUSBConfig* usb_get_config(void);
SerialUSBDriver* usb_get_sdu(void);
THD_FUNCTION(UsbSerThread, arg);

#endif

