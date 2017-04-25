import time
import ntpserver
import serial

times = [
    "2017-01-01 00:00:00"
]


def sync(ser):
    """Talk to the BigTime USB interface and force a manual sync"""
    ser.write("sync\n".encode("ascii"))


def check_epoch(ser, epoch, tolerance=1):
    """Talk to the BigTime USB interface and check the epoch time matches the
       epoch time passed as an argument with tolerance specified in seconds.
       Print an error if it doesn't match."""
    ser.write("epoch\n".encode("ascii"))
    result = ser.readline().decode("ascii")
    read_epoch = float(result)
    if abs(epoch - read_epoch) > tolerance:
        print("Epoch time does not match.")
        print("Clock said {}. Should be {}".format(result, epoch))


def check_local(ser, epoch, tolerance=1):
    """Talk to the BigTime USB interface and check the formatted localtime
       matches epoch seconds passed, with tolerance specified in seconds. Print
       an error if it doesn't match."""
    ser.write("datetime\n".encode("ascii"))
    result = ser.readline().decode("ascii")
    read_tm = time.strptime(result, "%Y-%m-%d %H:%M:%S")
    if abs(time.mktime(read_tm) - epoch) > tolerance:
        print("Formatted time does not match.")
        print("Clock said {}. Should be {}".format(result, time.strftime(
            "%Y-%m-%d %H:%M:%S", epoch)))


if __name__ == "__main__":
    ser = serial.Serial('/dev/ttyUSB0')

    # Empty out the buffer so we ignore the start-up text
    ser.nonblocking()
    ser.timeout = 0
    while len(ser.read(1024)) != 0:
        pass
    ser.timeout = None

    # Start up the NTP server
    ntp = ntpserver.NTPServer()
    ntp.start(port=1337)

    for timestamp in times:
        tm = time.strptime(timestamp, "%Y-%m-%d %H:%M:%S")
        epoch = time.mktime(tm)
        print("Serving {}".format(timestamp))
        ntp.set_time(epoch)

        sync(ser)
        check_epoch(ser, epoch)
        check_local(ser, epoch)

        time.sleep(5)
        check_epoch(ser, epoch + 5)
        check_local(ser, time.strftime("%Y-%m-%d %H:%M:%S", epoch + 5))

    ntp.stop()
    ser.close()
