import socket
import time
import select
import ntplib


def startServer(listenIp="0.0.0.0", listenPort=123, single=False,
                timestamp=None, quiet=False):
    """
    Start an NTP server listening on interface listenIp, UDP port listenPort
    If single is set to True then the function exits after the first NTP
    response is sent.  Otherwise it continues servicing requests indefinitely.
    timestamp is the seconds since epoch to send to each request.  If
    timestamp is None then each request is sent the current system time.
    """
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((listenIp, listenPort))
    if not quiet:
        print("Listening at {}:{}".format(listenIp, listenPort))

    while True:
        try:
            rlist, wlist, elist = select.select([sock], [], [], 1)
        except KeyboardInterrupt:
            print("Exiting.")
            return

        if len(rlist) != 0:
            for tempSocket in rlist:
                try:
                    if timestamp is None:
                        recvTimestamp = ntplib.system_to_ntp_time(time.time())
                    else:
                        recvTimestamp = ntplib.system_to_ntp_time(timestamp)

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
                    if timestamp is None:
                        sendPacket.tx_timestamp = ntplib.system_to_ntp_time(
                                time.time())
                    else:
                        sendPacket.tx_timestamp = ntplib.system_to_ntp_time(
                                timestamp)
                    sock.sendto(sendPacket.to_data(), addr)
                    if not quiet:
                        print("Sent timestamp {} to {}:{}".format(
                            recvTimestamp, addr[0], addr[1]))
                    if single:
                        return
                except socket.error as msg:
                    print(msg)

if __name__ == "__main__":
    startServer()
