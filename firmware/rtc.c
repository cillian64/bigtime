#include <stdint.h>
#include <time.h>

#include <hal.h>

#include "rtc.h"

#define RTC_TR_PM_OFFSET                    22
#define RTC_TR_HT_OFFSET                    20
#define RTC_TR_HU_OFFSET                    16
#define RTC_TR_MNT_OFFSET                   12
#define RTC_TR_MNU_OFFSET                   8
#define RTC_TR_ST_OFFSET                    4
#define RTC_TR_SU_OFFSET                    0

// Is the given year (AD) a leap year? Doesn't handle century non-leap years
static bool is_leap_year(uint16_t year);

// Give the number of days in a given year.  Year is in years AD.
static uint16_t days_in_year(uint16_t year);

// Give the number of days in a given month (1-based) in a given year (AD)
static uint8_t days_in_month(uint8_t month, uint16_t year);

void rtc_set(RTCDateTime *rtcDateTime)
{
    rtcSetTime(&RTCD1, rtcDateTime);

    // If you cared, you could do sub-second sync here.
    // See c7b82ad2eee0d093c1cfb0967da943a2d6f5f835
}

void rtc_get_bcd(struct BCDTime *bcdTime)
{
    uint32_t tr;
    syssts_t sts;

    // Enter a re-entrant critical zone
    sts = osalSysGetStatusAndLockX();
    // Sync with the RTC
    while((RTCD1.rtc->ISR & RTC_ISR_RSF) == 0);
    tr = RTCD1.rtc->TR;
    osalSysRestoreStatusX(sts);

    bcdTime->ht = (tr >> RTC_TR_HT_OFFSET) & 3;
    bcdTime->hu = (tr >> RTC_TR_HU_OFFSET) & 15;
    bcdTime->mnt = (tr >> RTC_TR_MNT_OFFSET) & 7;
    bcdTime->mnu = (tr >> RTC_TR_MNU_OFFSET) & 15;
    bcdTime->st = (tr >> RTC_TR_ST_OFFSET) & 7;
    bcdTime->su = (tr >> RTC_TR_SU_OFFSET) & 15;
}

int32_t rtc_delta(RTCDateTime *rtcBegin, RTCDateTime *rtcEnd)
{
    // Easiest way to do this is convert both times into an ntp timestamp,
    // shift to remove subseconds, then subtract.
    // This will break in 2036.
    uint64_t secsBegin = ntp_from_rtc(rtcBegin) >> 32;
    uint64_t secsEnd = ntp_from_rtc(rtcEnd) >> 32;
    return (int64_t)secsEnd - (int64_t)secsBegin;
}

void rtc_from_ntp(RTCDateTime *rtcOut, uint64_t ntpIn)
{
    uint32_t secs = ntpIn >> 32;

    // Remove years between 1900 (NTP epoch) and 1980 (RTCDateTime epoch).
    for(int year=1900; year<1980; year++)
        secs -= days_in_year(year) * 24 * 60 * 60;

    // Count years from 1980 to beginning of this year
    rtcOut->year = 0;
    while(secs > days_in_year(1980+rtcOut->year)*24u*60u*60u)
    {
        secs -= days_in_year(1980+rtcOut->year)*24*60*60;
        rtcOut->year += 1;
    }

    // Count months in the current year up to this month
    rtcOut->month = 1;
    while(secs > days_in_month(rtcOut->month, rtcOut->year)*24*60*60)
    {
        secs -= days_in_month(rtcOut->month, rtcOut->year)*24*60*60;
        rtcOut->month += 1;
    }

    // Days in the current month up to start of today
    rtcOut->day = 2 + secs / (24*60*60);
    secs = secs % (24*60*60);

    // And the time-of-day in milliseconds
    rtcOut->millisecond = secs*1000;

    // Add on the fractional second from lowest 32-bits of ntp stamp
    ntpIn &= 0x0000ffff;
    rtcOut->millisecond += (ntpIn*1000) >> 32;
}

uint64_t ntp_from_rtc(RTCDateTime *rtcDateTime)
{
    uint32_t secs = rtcDateTime->millisecond / 1000;

    // Add up time in months this year.
    // Time in rtcDateTime is since 1980
    for(int i=0; i < rtcDateTime->month; i++)
        secs += days_in_month(i, 1980+rtcDateTime->year) * 24 * 60 * 60;

    // Add up time in years before this one.  NTP time is since 1900
    for(int i=1900; i<rtcDateTime->year; i++)
        secs += days_in_year(1900+i) * 24 * 60 * 60;

    // Lowest 32-bits of NTP stamp holds binary fraction seconds
    uint16_t millis = rtcDateTime->millisecond % 1000;
    uint64_t ntpTime = ((uint64_t)millis << 32) / 1000;
    ntpTime |= (uint64_t)secs << 32;
    return ntpTime;
}

static bool is_leap_year(uint16_t year)
{
    return (year % 4 == 0) ? true : false;
}

uint16_t days_in_year(uint16_t year)
{
    return is_leap_year(year) ? 366 : 365;
}

uint8_t days_in_month(uint8_t month, uint16_t year)
{
    switch(month)
    {
        case 1: return 31;
        case 2: return is_leap_year(year) ? 29 : 28;
        case 3: return 31;
        case 4: return 30;
        case 5: return 31;
        case 6: return 30;
        case 7: return 31;
        case 8: return 31;
        case 9: return 30;
        case 10: return 31;
        case 11: return 30;
        case 12: return 31;
        default: chSysHalt("Invalid month in days_in_month");
    }
    return 0; // This can never happen.
}

bool is_bst(uint64_t ntpDateTime)
{
    // We need to calculate the current day of week
    uint32_t secs = ntpDateTime >> 32;
    // Days since 0000 1st January 1900:
    uint32_t days = secs / (24*60*60);
    // 1st January 1900 was a Monday, which we'll denote day 0, so sunday=6
    uint8_t day_of_week = days % 7;
    // Find what month it is, via an RTCDateTime.
    RTCDateTime rtcDateTime;
    rtc_from_ntp(&rtcDateTime, ntpDateTime);

    // The UK observes BST from 0100 UTC on the last Sunday of March
    // until 0100 UTC on the last Sunday of October.
    if(rtcDateTime.month < 3) {
        return false;
    } else if(rtcDateTime.month == 3) {
        // The earliest possible last sunday in march is the 25th.
        // The last day of March is the 31st.
        // If we're before the 25th March it's not BST
        // If we're after or on the 25th:
        //   Is it Sunday?
        //     Is it after 0100 UTC? It's BST. Otherwise not BST
        //   Is there a sunday in the remaining days of march after today?
        //     Yes? It's not BST
        //     No? It is BST
        if(rtcDateTime.day < 25) {
            return false;
        } else if(day_of_week == 6) {  // It the last sunday in march!
            if(rtcDateTime.millisecond >= 60*60*1000)
                return true;
            else
                return false;
        } else if(rtcDateTime.day + (6 - day_of_week) > 31) {
            // There are no more Sundays this march
            return true;
        } else {
            return false;
        }
    } else if(rtcDateTime.month < 10) {
        return true;
    } else if(rtcDateTime.month == 10) {
        // Same logic as March but inverted
        if(rtcDateTime.day < 25) {
            return true;
        } else if(day_of_week == 6) {
            if(rtcDateTime.millisecond >= 60*60*1000) {
                return false;
            } else {
                return true;
            }
        } else if(rtcDateTime.day + (6 - day_of_week) > 31) {
            // There are no more Sundays this march
            return false;
        } else {
            return true;
        }
    } else {
        return false;
    }
}
