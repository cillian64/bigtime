#include <stdint.h>
#include <time.h>

#include <hal.h>

#include "rtc.h"

void rtc_set(RTCDateTime *rtcDateTime)
{
    (void)rtcDateTime;
    // TODO
}

void rtc_get_bcd(struct BCDTime *bcdTime)
{
    (void)bcdTime;
    // TODO
}

int32_t rtc_delta(RTCDateTime *rtcBegin, RTCDateTime *rtcEnd)
{
    (void)rtcBegin;
    (void)rtcEnd;
    // TODO
    return 0;
}

void rtc_from_ntp(RTCDateTime *rtcOut, uint64_t ntpIn)
{
    (void)rtcOut;
    (void)ntpIn;
    // TODO
}
