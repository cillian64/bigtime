#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdint.h>
#include <stdbool.h>
#include "rtc.h"

// Initialise the display: Configure SPI1 and blank all digits
void display_init(void);

// Display the time from the BCD time struct.  DPs is an array of 4 bools
// showing which Decimal Point indicators to illuminate.
void display_time(struct BCDTime *bcdTime, bool DP);

// Display all 4 digits, with segments in board-specific order:
// Bit     7 6 5 4 3 2 1 0
// Segment E D C G B A F DP
void display_set(uint8_t *digits);

THD_FUNCTION(DisplayThread, arg);

#endif
