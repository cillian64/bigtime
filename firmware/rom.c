#include "rom.h"
#include "hal.h"

#define READ_CMD (0x03)

static SPIDriver* rom_spid = &SPID3;
static SPIConfig rom_spi_cfg = {
    .end_cb = NULL,
    .ssport = GPIOA,
    .sspad = 15,
    .cr1 = SPI_CR1_BR_1 | SPI_CR1_BR_2,
};

void rom_get_eui48(uint8_t* id)
{
    uint8_t txbuf[2] = {READ_CMD, 0xFA};
    spiStart(rom_spid, &rom_spi_cfg);
    spiSelect(rom_spid);
    spiSend(rom_spid, 2, txbuf);
    spiReceive(rom_spid, 6, id);
    spiUnselect(rom_spid);
    spiStop(rom_spid);
}
