#include "display.h"
#include "hal.h"

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
}

void display_init(void)
{
    spiStart(display_spid, &display_spi_cfg);
}

void display_bcd(uint8_t *digits, bool *dps, uint8_t ndigits)
{
    for(int i=0; i<ndigits; i++)
    {
        digits[i] = display_font[digits[i]];
        digits[i] |= dps[i] << 7;
    }
    display_set(digits, ndigits);
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
        spiSend(display_spid, 1, txbuf);
    }
    spiUnselect(display_spid);
}
