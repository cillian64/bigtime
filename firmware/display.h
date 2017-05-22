#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdint.h>
#include <stdbool.h>
#include "rtc.h"

// Initialise the display: Configure SPI1 and blank all digits
void display_init(void);

// Display the time from the BCD time struct
void display_time(struct BCDTime *bcdTime, bool has_seconds);

// Display digits, with segments in board-specific order:
// Bit     7 6 5 4 3 2 1 0
// Segment E D C G B A F DP
void display_set(uint8_t *digits, uint8_t ndigits);

#endif
