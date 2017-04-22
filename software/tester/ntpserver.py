import socket
import time
import select
import ntplib
import threading


class NTPServer:
    """
    Start an NTP server listening on interface address, UDP port port.
    time is the seconds since epoch to send to each request.  If time is None
    then each request is sent the current system time.

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
        self._thread = threading.Thread(target=self._run,
                                        args=[address, port])
        self._thread.start()

    def stop(self):
        self._stopflag = True
        self._thread.join()

    def set_time(self, time):
        self._time_lock.acquire()
        self._time = time
        self._time_lock.release()

    def _run(self, address, port):
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.bind((address, port))
        while True:
            if self._stopflag:
                return
            rlist, wlist, elist = select.select([sock], [], [], 1)
            for tempSocket in rlist:
                try:
                    self._time_lock.acquire()
                    if self._time is None:
                        recvTimestamp = ntplib.system_to_ntp_time(time.time())
                    else:
                        recvTimestamp = ntplib.system_to_ntp_time(self._time)

                    data, addr = tempSocket.recvfrom(1024)
                    recvPacket = ntplib.NTPPacket()
                    recvPacket.from_data(data)
                    timeStamp_high = ntplib._to_int(recvPacket.tx_timestamp)
                    timeStamp_low = ntplib._to_frac(recvPacket.tx_timestamp)
                    sendPacket = ntplib.NTPPacket(version=3, mode=4)
                    sendPacket.stratum = 2
                    sendPacket.poll = 10
                    sendPacket.ref_timestamp = recvTimestamp-5
                    sendPacket.orig_timestamp = ntplib._to_time(
                        timeStamp_high, timeStamp_low)
                    sendPacket.recv_timestamp = recvTimestamp
                    if self._time is None:
                        sendPacket.tx_timestamp = ntplib.system_to_ntp_time(
                                time.time())
                    else:
                        sendPacket.tx_timestamp = ntplib.system_to_ntp_time(
                                self._time)
                    sock.sendto(sendPacket.to_data(), addr)
                    self._time_lock.release()
                except socket.error as msg:
                    print(msg)


if __name__ == "__main__":
    ntp = NTPServer()
    ntp.start()
