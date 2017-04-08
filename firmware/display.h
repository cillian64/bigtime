#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdint.h>
#include <stdbool.h>
#include "rtc.h"

// Initialise the display: Configure SPI1 and blank all digits
void display_init(void);

// Display the time from the BCD time struct
void display_time(struct BCDTime *bcdTime, bool has_seconds);

#endif
