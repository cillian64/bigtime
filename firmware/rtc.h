#ifndef RTC_H
#define RTC_H

#include <stdint.h>
#include <time.h>
#include <hal.h>

struct BCDTime {
    uint8_t ht, hu, mnt, mnu, st, su;
};

// Set the RTC to an RTCDateTime including sub-second sync
void rtc_set(RTCDateTime *rtcDateTime);

// Get the current RTC time in BCD form
void rtc_get_bcd(struct BCDTime *bcdTime);

// Find the difference in seconds between two RTCDateTimes: End - Begin
int32_t rtc_delta(RTCDateTime *rtcBegin, RTCDateTime *rtcEnd);

// Convert an NTP timestamp (in UTC) to an RTCDateTime in London time (GMT or
// BST).
void rtc_from_ntp(RTCDateTime *rtcOut, uint64_t ntpIn);

#endif
