#ifndef RTC_H
#define RTC_H

#include <stdint.h>
#include <time.h>
#include <hal.h>

// Set the RTC to an RTCDateTime including sub-second sync
void rtc_set(RTCDateTime *rtcDateTime);

// Find the difference in seconds between two RTCDateTimes: End - Begin
int32_t rtc_delta(RTCDateTime *rtcBegin, RTCDateTime *rtcEnd);

// Convert an NTP timestamp (in UTC) to an RTCDateTime in London time (GMT or
// BST) including sub-second precision.
void rtc_from_ntp(RTCDateTime *rtcOut, uint64_t ntpIn);

// Convert an RTCDateTime to an NTP timestamp
uint64_t ntp_from_rtc(RTCDateTime *rtcDateTime);

// Calculate whether the given RTCDateTime is within British Summer Time
bool is_bst(RTCDateTime *rtcDateTime);

#endif
