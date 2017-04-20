import time
import ntpserver

times = [
    "2017-01-01 00:00:00"
]


def sync():
    """Talk to the BigTime USB interface and force a manual sync"""
    raise NotImplementedError


def check_epoch(epoch, tolerance=1):
    """Talk to the BigTime USB interface and check the epoch time matches the
       epoch time passed as an argument with tolerance specified in seconds.
       Print an error if it doesn't match."""
    raise NotImplementedError


def check_local(timestamp, tolerance=1):
    """Talk to the BigTime USB interface and check the formatted localtime
       matches the timestamp string passed as an argument with tolerance
       specified in seconds. Print an error if it doesn't match."""
    raise NotImplementedError


if __name__ == "__main__":
    for timestamp in times:
        tm = time.strptime(timestamp, "%Y-%m-%d %H:%M:%S")
        epoch = time.mktime(tm)
        print("Serving {}".format(timestamp))
        ntpserver.startServer(single=True, timestamp=epoch, quiet=True)
        sync()
        check_epoch(epoch)
        check_local(timestamp)
        ntpserver.stopServer()

        time.sleep(5)
        check_epoch(epoch + 5)
        check_local(time.strftime("%Y-%m-%d %H:%M:%S", epoch + 5))
