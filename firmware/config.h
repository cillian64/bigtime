#ifndef CONFIG_H
#define CONFIG_H

#include <stdint.h>
#include <stdbool.h>
#include <lwip/ip_addr.h>

#define MAX_FQDN_LEN 255

typedef struct bigtime_config_t {
    bool net_dhcp_enable;
    char net_hostname[MAX_FQDN_LEN];
    ip_addr_t net_static_ip;
    ip_addr_t net_static_netmask;
    ip_addr_t net_static_gateway;
    ip_addr_t net_static_dns1;
    ip_addr_t net_static_dns2;

    char ntp_server1[MAX_FQDN_LEN];
    char ntp_server2[MAX_FQDN_LEN];
    char ntp_server3[MAX_FQDN_LEN];
    uint16_t ntp_sync_time;

    bool disp_sync;
    bool disp_auto_bst;
} bigtime_config_t;
extern bigtime_config_t bigtime_config;

typedef struct bigtime_state_t {
    bool syncing;
    bool force_sync;
    RTCDateTime last_synced;
} bigtime_state_t;
extern bigtime_state_t bigtime_state;

// Save bigtime_config to flash
void config_save(void);
// Load bigtime_config from flash. Blank config and return false if CRC invalid.
bool config_load(void);

#endif
