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

// Convert an RTCDateTime to an NTP timestamp
static uint64_t ntp_from_rtc(RTCDateTime *rtcDateTime);

// Is the given year (AD) a leap year? Doesn't handle century non-leap years
static bool is_leap_year(uint16_t year);

// Give the number of days in a given year.  Year is in years AD.
static uint16_t days_in_year(uint16_t year);

// Give the number of days in a given month (1-based) in a given year (AD)
static uint8_t days_in_month(uint8_t month, uint16_t year);

void rtc_set(RTCDateTime *rtcDateTime)
{
    // First use rtcSetTime to set date and time to the nearest second
    rtcSetTime(&RTCD1, rtcDateTime);

    // Now do sub-second synchronisation
    syssts_t sts = osalSysGetStatusAndLockX();
    while(((RTCD1.rtc->ISR & RTC_ISR_RSF) == 0)
          || ((RTCD1.rtc->ISR & RTC_ISR_SHPF) != 0));
    uint16_t ss = RTCD1.rtc->SSR & 0x0000ffff;
    uint16_t prediv_s = RTCD1.rtc->PRER & 0x0000ffff;
    // The next part is fixed point. The float equivalent is:
    // float actual_second = (prediv_s - ss) / (prediv_s + 1);
    // float desire_second = (rtcDateTime->millisecond % 1000) / 1000;
    //     delay += 1.0;
    // RTCD1.rtc->RTC_SHIFTR |= (uint16_t)(delay * (prediv_s + 1));
    uint16_t current_ss  = (prediv_s - ss);
    uint16_t desire_ss =
        (uint32_t)rtcDateTime->millisecond % 1000u * (prediv_s + 1) / 1000u;
    int32_t delay = current_ss - desire_ss;
    if(delay < 0)
    {
        RTCD1.rtc->SHIFTR |= RTC_SHIFTR_ADD1S;
        delay += prediv_s + 1;
    }
    RTCD1.rtc->SHIFTR |= (uint16_t)delay;
    osalSysRestoreStatusX(sts);
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
    rtcOut->day = 1 + secs / (24*60*60);
    secs = secs % (24*60*60);

    // And the time-of-day in milliseconds
    rtcOut->millisecond = secs*1000;

    // Add on the fractional second from lowest 32-bits of ntp stamp
    ntpIn &= 0x0000ffff;
    rtcOut->millisecond += (ntpIn*1000) >> 32;
}

static uint64_t ntp_from_rtc(RTCDateTime *rtcDateTime)
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