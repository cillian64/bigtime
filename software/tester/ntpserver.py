import socket
import time
import select
import ntplib
import threading


class NTPServer:
    """
    A simple NTP server.  By default, serves the current system time.
    set_time can be used to specify a timestamp in epoch-seconds.
    set_time(None) to return to serving system time.

    ntp = NTPServer()
    ntp.start(address="0.0.0.0", port=123)
    ntp.set_time(12345)
    ntp.stop()
    """
    def __init__(self):
        self._stopflag = False
        self._time = None
        self._time_lock = threading.Lock()
        self._thread = None

    def start(self, address="0.0.0.0", port=123):
        """
        Start the NTP server on the specified interface and port.  If the
        server is already running, restart it on the new interface and port
        """
        if self._thread is not None:
            self.stop()
        self._stopflag = False
        self._thread = threading.Thread(target=self._run,
                                        args=[address, port])
        self._thread.daemon = True
        self._thread.start()

    def stop(self):
        """
        Stop the NTP server if it is running.
        """
        if self._thread is not None:
            self._stopflag = True
            self._thread.join()
            self._thread = None

    def set_time(self, time):
        """
        Set the timestamp to be served.  Units are system epoch-seconds.
        Pass time=None to serve system time.
        """
        self._time_lock.acquire()
        self._time = time
        self._time_lock.release()

    def _run(self, address, port):
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.bind((address, port))
        while not self._stopflag:
            rlist, wlist, elist = select.select([sock], [], [], 1)
            for tempSocket in rlist:
                with self._time_lock:
                    if self._time is None:
                        recvTimestamp = ntplib.system_to_ntp_time(
                            time.time())
                    else:
                        recvTimestamp = ntplib.system_to_ntp_time(
                            self._time)

                    data, addr = tempSocket.recvfrom(1024)
                    recvPacket = ntplib.NTPPacket()
                    recvPacket.from_data(data)
                    timeStamp_high = ntplib._to_int(
                        recvPacket.tx_timestamp)
                    timeStamp_low = ntplib._to_frac(
                        recvPacket.tx_timestamp)
                    sendPacket = ntplib.NTPPacket(version=3, mode=4)
                    sendPacket.stratum = 2
                    sendPacket.poll = 10
                    sendPacket.ref_timestamp = recvTimestamp-5
                    sendPacket.orig_timestamp = ntplib._to_time(
                        timeStamp_high, timeStamp_low)
                    sendPacket.recv_timestamp = recvTimestamp
                    if self._time is None:
                        sendPacket.tx_timestamp = (
                            ntplib.system_to_ntp_time(time.time()))
                    else:
                        sendPacket.tx_timestamp = (
                            ntplib.system_to_ntp_time(self._time))
                    sock.sendto(sendPacket.to_data(), addr)


if __name__ == "__main__":
    ntp = NTPServer()
    ntp.start()
