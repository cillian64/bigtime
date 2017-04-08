#include "display.h"
#include "hal.h"
#include "rtc.h"

// Set the 7-segment digits. Each byte is packed as
// Bit      7 6 5 4 3 2 1 0
// Segment DP A B C D E F G
void display_set(uint8_t *digits, uint8_t ndigits);

static SPIDriver* display_spid = &SPID1;
static SPIConfig display_spi_cfg = {
    .end_cb = NULL,
    .ssport = GPIOB,
    .sspad = 4,
    .cr1 = SPI_CR1_BR_1 | SPI_CR1_BR_2,
};

// For each number 0-9, return the segments 0ABCDEFG
static uint8_t display_font[10] = {
    0b01111110,  // 0
    0b00110000,  // 1
    0b01101101,  // 2
    0b01111001,  // 3
    0b00110011,  // 4
    0b01011011,  // 5
    0b01011111,  // 6
    0b01110000,  // 7
    0b01111111,  // 8
    0b01111011,  // 9
};

void display_init(void)
{
    spiStart(display_spid, &display_spi_cfg);
    uint8_t digits[6] = {0};
    display_set(digits, 6);
}

void display_time(struct BCDTime *bcdTime, bool has_seconds)
{
    uint8_t digits[6];
    digits[5] = display_font[bcdTime->ht];
    digits[4] = display_font[bcdTime->hu];
    digits[3] = display_font[bcdTime->mnt];
    digits[2] = display_font[bcdTime->mnu];
    digits[1] = display_font[bcdTime->st];
    digits[0] = display_font[bcdTime->su];

    // Set DP in the middle:
    bcdTime->hu |= 0b10000000;
    if(has_seconds)
        display_set(digits, 6);
    else
        display_set(digits+2, 4);
}

void display_set(uint8_t *digits, uint8_t ndigits)
{
    uint8_t tx_buf;
    spiSelect(display_spid);
    for(int i=0; i<ndigits; i++)
    {
        // Remap from segments to board order:
        tx_buf |= (digits[i] & 0b10000000) >> 7;
        tx_buf |= (digits[i] & 0b01000000) >> 1;
        tx_buf |= (digits[i] & 0b00100000) << 1;
        tx_buf |= (digits[i] & 0b00010000) >> 3;
        tx_buf |= (digits[i] & 0b00001000) >> 1;
        tx_buf |= (digits[i] & 0b00000100) << 1;
        tx_buf |= (digits[i] & 0b00000010) << 4;
        tx_buf |= (digits[i] & 0b00000001) << 4;
        spiSend(display_spid, 1, &tx_buf);
    }
    spiUnselect(display_spid);
}
