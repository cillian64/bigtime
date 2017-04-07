#ifndef PORTFIRE_DISPLAY_H
#define PORTFIRE_DISPLAY_H

#include <stdint.h>

// Initialise the display: Configure SPI1
void display_init(void);

// Display digits and decimal points on the displays.  each element in digit is
// a single digit of unpacked BCD.  Each element of dps says whether that
// digit's decimal point is turned on.  digits and dps each have ndigits
// elements.
void display_bcd(uint8_t *digits, bool *dps uint8_t ndigits);

// Set the 7-segment digits.  Each byte is packed as:
// Bit 7: DP
// Bit 6: A
// Bit 5: B
// Bit 4: C
// Bit 3: D
// Bit 2: E
// Bit 1: F
// Bit 0: G
void display_set(uint8_t *digits, uint8_t ndigits);

#endif
