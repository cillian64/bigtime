# Setting Up ChibiOS

```
git submodule update --init
cd ChibiOS/ext
7za x lwip-1.4.1_patched.7z
cd ..
patch -p0 < ../lwip_ip_addr.patch
cd ..
```

# Logic
## Architecture
### Shared data
The STM32F4 RTC peripheral's date-time will hold the current time in UTC:
* Year (BCD)
* Month (BCD)
* Day of month (BCD)
* Day of week (BCD)
* Hour (BCD)
* Minute (BCD)
* Second (BCD)

A configuration store will hold network settings (DHCP or
IP+network+gateway+DNS), NTP settings (A list of NTP servers and a time-of-day
to sync the time), display settings (12 or 24 hour time, flashing second
marker, whether to display sync status), timezone, and whether daylight savings
should be automatically applied:
* Network
    * DHCP enable (bool)
    * Static IP address (uint32_t consisting 4 octets)
    * Network mask (uint32_t consisting 4 octets)
    * Gateway IP address (uint32_t consisting 4 octets)
    * DNS server 1 (uint32_t consisting 4 octets)
    * DNS server 2 (uint32_t consisting 4 octets)
* NTP
    * NTP server 1 (String: hostname or IP address)
    * NTP server 2 (String: hostname or IP address)
    * NTP server 3 (String: hostname or IP address)
    * Time-of-day to synchronise (uint16_t holding a 24-hour time)
* Time and Display
    * 24-hour time (bool)
    * Flashing second indicator (bool)
    * Display sync status (bool)
    * Timezone (int16_t holding an adjustment in 24 hour time, e.g. 0000 for
      London, 545 for Nepal, -1000 for Hawaii).
    * Automatic DST adjustment (bool)

A state structure will hold whether the current time is considered
synchronised or free-running and whether/when any NTP servers have sent a "Kiss
of Death" (KoD) and should be avoided.
* Synchronised (bool)
* NTP server 1 KoD (bool)
* NTP server 2 KoD (bool)
* NTP server 3 KoD (bool)

### Threads
The display thread will retrieve the time from the RTC, the sync status from
the state structure, and the display settings from the configuration structure.
It will then drive the LED shift registers.

The NTP thread will handle time synchronisation.  It will run through each NTP
server in the list and attempt to retrieve the time.  Upon a receive timeout it
will retry the same server several times.  Upon a network failure or KoD
response, it will proceed to the next server in the list.  If the final server
on the list fails, the NTP thread will return to the first.  If all servers are
being avoided due to KoD, the NTP thread will wait until a server becomes
available again.  After a successful synchronisation it will set the
"synchronised" flag to True and update the RTC peripheral's time-date.  It will
then sleep until the next synchronisation time.  At that time it will set the
synchronised flag to false and attempt synchronisation.

## Time anomalies
### Timezones
The RTC peripheral holds the time in UTC, as given by NTP.  Each time this is
read, the timezone adjustment is applied

### Daylight Savings adjustments
DST is applied using the rules for British Summer Time.  BST begins at 0100 UTC
on the last Sunday in March and ends at 0100 UTC on the last Sunday in October.
If the current date-time falls between these moments then the DST feature of
the RTC peripheral is enabled.  This automatically adds an hour to the time,
before timezone adjustment.

### Leap years
Knowing the calendar date, the RTC peripheral automatically compensates for
leap years.

### Leap seconds
If we pay no attention to leap seconds, we will be incorrect by 1 second
between a leap second and our next NTP synchronisation.  For a clock with a
precision of minutes, this seems acceptable.

NTP does provide advance warning of a leap second which we could use manually
adjust the RTC time between the leap second occurring and our next successful
synchronisation.  I strongly suspect the RTC peripheral will not handle a
seconds value of 60, so if we want to display the correct time, with a
precision of seconds, during the leap second, we will probably need to apply
the offset after reading the time from the RTC (i.e. at the same time as
timezone adjustment) and ensure our time-handling and display procedures can
handle a 61 second minute.
