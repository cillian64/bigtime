#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include "sntp.h"

int main()
{
    uint64_t ntp_time;
    const uint32_t unix_epoch_in_ntp = 2208988800u;
    time_t unix_time;
    int result = get_ntp_timestamp("pool.ntp.org", &ntp_time);
    if(result != SNTP_SUCCESS)
    {
        printf("SNTP failed: %d\n", result);
        return -1;
    }

    unix_time = (ntp_time >> 32) - unix_epoch_in_ntp;
    printf("The local time is %s", ctime(&unix_time));

    return 0;
}


