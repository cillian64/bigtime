#ifndef SNTP_H
#define SNTP_H

#include <stdint.h>

#define SNTP_UNKNOWN    0
#define SNTP_SUCCESS    1
#define SNTP_NETWORK    2
#define SNTP_KOD_DENY   3
#define SNTP_KOD_RATE   4
#define SNTP_KOD_OTHER  5

// Connect to the supplied NTP server and retrieve the current timestamp.
// Network and other latencies are not adjusted for.  Returns a result code
int get_ntp_timestamp(char *ntp_host, uint64_t *timestamp);

#endif
