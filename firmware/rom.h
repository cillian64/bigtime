#ifndef ROM_H
#define ROM_H

#include <stdint.h>

/* Read the six-byte EUI48 ID into `id`. */
void rom_get_eui48(uint8_t* id);

#endif
