import socket
import time
import select
import ntplib
import threading


class NTPServer(threading.Thread):
    """
    Start an NTP server listening on interface address, UDP port port.
    time is the seconds since epoch to send to each request.  If time is None
    then each request is sent the current system time.

    ntp = NTPServer(address="0.0.0.0", port=123)
    ntp.start()
    ntp.time = 12345
    ntp.stop()
    """
    def __init__(self, address="0.0.0.0", port=123):
        threading.Thread.__init__(self)
        self.stopflag = False
        self.time = None
        self.address = address
        self.port = port

    def stop(self):
        self.stopflag = True

    def run(self):
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.bind((self.address, self.port))
        while True:
            if self.stopflag:
                return
            rlist, wlist, elist = select.select([sock], [], [], 1)
            for tempSocket in rlist:
                try:
                    if self.time is None:
                        recvTimestamp = ntplib.system_to_ntp_time(time.time())
                    else:
                        recvTimestamp = ntplib.system_to_ntp_time(self.time)

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
                    if self.time is None:
                        sendPacket.tx_timestamp = ntplib.system_to_ntp_time(
                                time.time())
                    else:
                        sendPacket.tx_timestamp = ntplib.system_to_ntp_time(
                                self.time)
                    sock.sendto(sendPacket.to_data(), addr)
                except socket.error as msg:
                    print(msg)


if __name__ == "__main__":
    ntp = NTPServer()
    ntp.start()
