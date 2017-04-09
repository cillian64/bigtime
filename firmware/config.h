#ifndef CONFIG_H
#define CONFIG_H

#include <stdint.h>
#include <stdbool.h>

typedef struct bigtime_config_t {
    bool net_dhcp_enable;
    uint32_t net_static_ip;
    uint32_t net_static_netmask;
    uint32_t net_static_gateway;
    uint32_t net_static_dns1;
    uint32_t net_static_dns2;

    char ntp_server1[256];
    char ntp_server2[256];
    char ntp_server3[256];
    uint16_t ntp_interval;

    bool disp_flash_second;
    bool disp_sync;
    bool disp_has_seconds;
    bool disp_bst;
} bigtime_config_t;

extern bigtime_config_t bigtime_config;

// Save bigtime_config to flash
void config_save(void);
// Load bigtime_config from flash. Blank config if CRC invalid.
void config_load(void);

#endif
