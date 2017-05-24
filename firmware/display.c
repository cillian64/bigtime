#include "display.h"
#include "hal.h"
#include "rtc.h"
#include "config.h"

static SPIDriver *display_spid = &SPID1;
static SPIConfig display_spi_cfg = {
    .end_cb = NULL,
    .ssport = GPIOB,
    .sspad = 4,
    .cr1 = SPI_CR1_BR_1 | SPI_CR1_BR_2,
};

// Display is laid out with DP at top left, segments:
// .
//  a
// f b
//  g
// e c
//  d

// Shift register bits map to segments as follows:
// 0 LSbit DP
// 1       f
// 2       a
// 3       b
// 4       g
// 5       c
// 6       d
// 7 MSbit e

// For each number 0-9, return the segments 0ABCDEFG
static uint8_t display_font[10] = {
    0b11101110,  // 0
    0b00101000,  // 1
    0b11011100,  // 2
    0b01111100,  // 3
    0b00111010,  // 4
    0b01110110,  // 5
    0b11110110,  // 6
    0b00101100,  // 7
    0b11111110,  // 8
    0b01111110,  // 9
};

void display_init(void)
{
    spiStart(display_spid, &display_spi_cfg);
    uint8_t digits[4] = {0};
    display_set(digits);
}

void display_time(struct BCDTime *bcdTime, bool DP)
{
    uint8_t digits[4];
    // display_font converts a digit into 7-segment format
    // with the bits in the right order for this board.
    digits[0] = display_font[bcdTime->ht];
    if(DP)
        digits[0] |= 0x01;
    digits[1] = display_font[bcdTime->hu];
    digits[2] = display_font[bcdTime->mnt];
    digits[3] = display_font[bcdTime->mnu];
    display_set(digits);
}

void display_set(uint8_t *digits)
{
    uint8_t tx_buf;
    spiStart(display_spid, &display_spi_cfg);
    spiSelect(display_spid);
    for(int i=0; i < 4; i++)
    {
        tx_buf = digits[i];
        spiSend(display_spid, 1, &tx_buf);
    }
    spiUnselect(display_spid);
}

THD_FUNCTION(DisplayThread, arg)
{
    (void)arg;
    struct BCDTime bcdTime;

    display_init();
    while(1)
    {
        rtc_get_bcd(&bcdTime);
        display_time(&bcdTime,
                bigtime_state.syncing && bigtime_config.disp_sync);
        chThdSleepMilliseconds(1000);
    }
}
