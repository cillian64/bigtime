#ifndef SNTP_H
#define SNTP_H

#include <stdint.h>

#define SNTP_SUCCESS    0
#define SNTP_NETWORK    1
#define SNTP_KOD_DENY   2
#define SNTP_KOD_RATE   3
#define SNTP_KOD_OTHER  4
// Connect to the supplied NTP server and retrieve the current timestamp.
// Network and other latencies are not adjusted for.  Returns a result code
int get_ntp_timestamp(char *ntp_host, uint64_t *timestamp);

#endif
