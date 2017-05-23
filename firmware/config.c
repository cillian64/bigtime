// Based on m3fc_flash.c, part of Martlet 3 avionics
// by Adam Greig, Cambridge University Spaceflight

#include <string.h>
#include "ch.h"
#include "hal.h"
#include "config.h"

#define FLASH_CFG_SECTOR (11)
#define FLASH_CFG_ADDR ((uint32_t*)0x080e0000)

bigtime_config_t bigtime_config;
bigtime_state_t bigtime_state;

// Return CRC of memory location
static uint32_t do_crc(uint32_t* src, size_t n);
static inline bool flash_wait_write(void);
// Write memory location to flash
static void flash_write(uint32_t *src, uint32_t *dst, size_t n);
// Read memory location from flash: return true if CRC matched else false
static bool flash_read(uint32_t *src, uint32_t *dst, size_t n);

static void flash_write(uint32_t *src, uint32_t *dst, size_t n)
{
    chDbgAssert(dst >= (uint32_t*)0x080e0000 && dst < (uint32_t*)0x08100000,
                "dst must be in flash sector 11");
    chDbgAssert((src >= (uint32_t*)0x20000000 && src < (uint32_t*)0x20020000)
                ||
                (src >= (uint32_t*)0x10000000 && src < (uint32_t*)0x10010000),
                "src must be in ram");

    size_t i;
    uint32_t checksum = do_crc(src, n);

    /* Wait for any ongoing flash operations */
    while(FLASH->SR & FLASH_SR_BSY);

    /* Unlock flash */
    FLASH->KEYR = 0x45670123;
    FLASH->KEYR = 0xCDEF89AB;

    /* Erase our configuration sector */
    FLASH->CR = FLASH_CR_SER | (FLASH_CFG_SECTOR<<3);
    FLASH->CR |= FLASH_CR_STRT;

    /* Wait for erase completion */
    while(FLASH->SR & FLASH_SR_BSY);

    /* Write flash in 32bit chunks */
    FLASH->CR = FLASH_CR_PG | FLASH_CR_PSIZE_1;
    for(i=0; i<n; i++) {
        dst[i] = src[i];
        if(!flash_wait_write()) {
            break;
        }
    }

    /* Write checksum */
    dst[n] = checksum;
    flash_wait_write();

    /* Re-lock flash */
    FLASH->CR |= FLASH_CR_LOCK;
}

static bool flash_read(uint32_t *src, uint32_t *dst, size_t n) {
    chDbgAssert(src >= (uint32_t*)0x080e0000 && src < (uint32_t*)0x08100000,
                "src must be in flash sector 11");
    chDbgAssert((dst >= (uint32_t*)0x20000000 && dst < (uint32_t*)0x20020000)
                ||
                (dst >= (uint32_t*)0x10000000 && dst < (uint32_t*)0x10010000),
                "dst must be in ram");
    size_t i;
    for(i=0; i<n; i++) {
        dst[i] = src[i];
    }
    uint32_t flash_crc = src[n];
    uint32_t ram_crc = do_crc(dst, n);
    return ram_crc == flash_crc;
}

static uint32_t do_crc(uint32_t* src, size_t n) {
    uint32_t crc;
    size_t i;
    RCC->AHB1ENR |= RCC_AHB1ENR_CRCEN;
    CRC->CR |= CRC_CR_RESET;
    for(i=0; i<n; i++) {
        CRC->DR = src[i];
    }
    crc = CRC->DR;
    RCC->AHB1ENR &= ~RCC_AHB1ENR_CRCEN;
    return crc;
}

static inline bool flash_wait_write(void) {
    while(FLASH->SR & FLASH_SR_BSY);
    if(FLASH->SR & FLASH_SR_PGSERR ||
       FLASH->SR & FLASH_SR_PGPERR ||
       FLASH->SR & FLASH_SR_PGAERR ||
       FLASH->SR & FLASH_SR_WRPERR)
    {
        chSysHalt("Flash write failed.");
        return false;
    } else {
        return true;
    }
}

void config_save(void)
{
    flash_write((uint32_t*)&bigtime_config, FLASH_CFG_ADDR,
                sizeof(bigtime_config));
}

bool config_load(void)
{
    bool crc = flash_read(FLASH_CFG_ADDR, (uint32_t*)&bigtime_config,
                          sizeof(bigtime_config));
    if(!crc)
        memset(&bigtime_config, 0, sizeof(bigtime_config));
    return crc;
}
