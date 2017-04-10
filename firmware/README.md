# Setting Up ChibiOS

```
git submodule update --init
cd ChibiOS/ext
7za x lwip-1.4.1_patched.7z
cd ..
patch -p0 < ../lwip_ip_addr.patch
git apply ../lwip_dhcp.patch
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
* Sub-second

Other state is held in RAM:
* Time of last sync             (datetime)
* NTP server 1 status           (int)
* NTP server 1 query time       (datetime)
* NTP server 2 status           (int)
* NTP server 2 query time       (datetime)
* NTP server 3 status           (int)
* NTP server 3 query time       (datetime)

Non-volatile storage will be used to hold configuration:
* Network
    * DHCP enable               (bool)
    * IP address                (uint32_t IP address)
    * Network mask              (uint32_t IP address)
    * Gateway IP address        (uint32_t IP address)
    * DNS server 1              (uint32_t IP address)
    * DNS server 2              (uint32_t IP address)
* NTP
    * NTP server 1              (string)
    * NTP server 2              (string)
    * NTP server 3              (string)
    * Synchronisation interval  (uint16_t in minutes)
* Time and Display
    * Flashing second indicator (bool)
    * Display sync status       (bool)
    * Has seconds display       (bool)
    * Automatic BST adjustment  (bool)


### Threads
The display thread will retrieve the time from the RTC, the sync status from
the state structure, and the display settings from the configuration structure.
It will then drive the LED shift registers.  It will display the current time,
the seconds indicator if enabled, and the sync indicator if enabled and
currently unsynchronised.

The NTP thread will handle time synchronisation.  It will run through each NTP
server in the list and attempt to retrieve the time.  Upon a receive timeout it
will retry the same server several times.  Upon a network failure or KoD
response, it will proceed to the next server in the list.  If the final server
on the list fails, the NTP thread will return to the first server.  If all
servers are being avoided due to KoD, the NTP thread will wait until a server
becomes available again.  After a successful synchronisation it will update the
RTC peripheral and store the time of synchronisation.  It then waits until the
synchronisation interval has passed.

## Time anomalies
### Timezones
Only London time (GMT/BST) is supported currently.

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
