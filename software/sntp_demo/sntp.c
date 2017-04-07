#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdint.h>
#include <time.h>

// Danger Will Robinson!
// htobe64 and be64toh don't exist everywhere.
#define IS_BIG_ENDIAN (*(uint16_t *)"\0\xff" < 0x100)
uint64_t hton64(uint64_t in)
{
    uint64_t out = 0;
    if(IS_BIG_ENDIAN)
        return in;
    out |= (uint64_t)htonl(in & 0xffffffff) << 32;
    out |= htonl(in >> 32);
    return out;
}
uint64_t ntoh64(uint64_t in)
{
    uint64_t out = 0;
    if(IS_BIG_ENDIAN)
        return in;
    out |= (uint64_t)htonl(in & 0xffffffff) << 32;
    out |= htonl(in >> 32);
    return out;
}


//const char* ntp_host = "ntp1.leontp.com";
//const char* ntp_host = "pool.ntp.org";
const char* ntp_host = "ntp1d.cl.cam.ac.uk";
const int dst_ntp_port = 123;
const int src_ntp_port = 1337;

#define NTP_FLAG_LEAP_MASK      0xc0 // 0b11000000
#define NTP_FLAG_LEAP_SHIFT     6
#define NTP_FLAG_VERSION_MASK   0x38 // 0b00111000
#define NTP_FLAG_VERSION_SHIFT  3
#define NTP_FLAG_MODE_MASK      0x07 // 0b00000111
#define NTP_FLAG_MODE_SHIFT     0

struct ntp_packet {
    uint8_t flags;
    uint8_t stratum;
    uint8_t poll_interval;
    uint8_t precision;

    // Word-aligned fields
    uint32_t root_delay;
    uint32_t root_dispersion;
    uint32_t reference_id;
    uint64_t reference_timestamp;
    uint64_t origin_timestamp;
    uint64_t receive_timestamp;
    uint64_t transmit_timestamp;
};

uint64_t do_sntp(void);
void ntp_exchange(const char* host, int port, struct ntp_packet *tx,
                  struct ntp_packet *rx);

void error(char *msg) {
    perror(msg);
    exit(1);
}

time_t ntp_to_unix(uint64_t ntp_timestamp)
{
    const uint32_t unix_epoch_in_ntp = 2208988800u;
    return (ntp_timestamp >> 32) - unix_epoch_in_ntp;
}

void print_ntp_timestamp(uint64_t ntp_timestamp)
{
    time_t unixtime = ntp_to_unix(ntp_timestamp);
    printf("%s", ctime(&unixtime));
}


void print_ntp_packet(struct ntp_packet *packet)
{
    printf("Leap indicator: %u\n",
        (packet->flags & NTP_FLAG_LEAP_MASK) >> NTP_FLAG_LEAP_SHIFT);
    printf("NTP version: %u\n",
        (packet->flags & NTP_FLAG_VERSION_MASK) >> NTP_FLAG_VERSION_SHIFT);
    printf("NTP mode: %u\n",
        (packet->flags & NTP_FLAG_MODE_MASK) >> NTP_FLAG_MODE_SHIFT);
    printf("Stratum: %u\n", packet->stratum);
    printf("Poll interval: %u\n", packet->poll_interval);
    printf("Precision: %i\n", packet->precision);
    printf("Root delay: %u\n", packet->root_delay);
    printf("Root dispersion: %u\n", packet->root_dispersion);
    printf("Reference ID: %u\n", packet->reference_id);
    print_ntp_timestamp(packet->reference_timestamp);
    print_ntp_timestamp(packet->origin_timestamp);
    print_ntp_timestamp(packet->receive_timestamp);
    print_ntp_timestamp(packet->transmit_timestamp);
}

void hton_ntp(struct ntp_packet *packet)
{
    packet->root_delay = htonl(packet->root_delay);
    packet->root_dispersion = htonl(packet->root_dispersion);
    packet->reference_id = htonl(packet->reference_id);
    packet->reference_timestamp = hton64(packet->reference_timestamp);
    packet->origin_timestamp = hton64(packet->origin_timestamp);
    packet->receive_timestamp = hton64(packet->receive_timestamp);
    packet->transmit_timestamp = hton64(packet->transmit_timestamp);
}

void ntoh_ntp(struct ntp_packet *packet)
{
    packet->root_delay = ntohl(packet->root_delay);
    packet->root_dispersion = ntohl(packet->root_dispersion);
    packet->reference_id = ntohl(packet->reference_id);
    packet->reference_timestamp = ntoh64(packet->reference_timestamp);
    packet->origin_timestamp = ntoh64(packet->origin_timestamp);
    packet->receive_timestamp = ntoh64(packet->receive_timestamp);
    packet->transmit_timestamp = ntoh64(packet->transmit_timestamp);
}

// Returns NTP timestamp.
uint64_t do_sntp(void)
{
    struct ntp_packet tx, rx;

    memset(&tx, 0, sizeof(tx));
    memset(&rx, 0, sizeof(rx));

    tx.flags |= 3 << NTP_FLAG_LEAP_SHIFT;       // Unsynchronised
    tx.flags |= 4 << NTP_FLAG_VERSION_SHIFT;    // NTPv4/SNTPv4
    tx.flags |= 3 << NTP_FLAG_MODE_SHIFT;       // Client
    tx.stratum = 16;                            // Unsynchronised
    tx.poll_interval = 12;                      // 2^10 second poll interval
    tx.precision = 0;                           // 2^(-0)s clock precision

    // Set all timestamps to a reasonable baseline
    tx.origin_timestamp = (uint64_t)(86400U * (365U * 70U + 17U)) << 32;
    tx.reference_timestamp = (uint64_t)(86400U * (365U * 70U + 17U)) << 32;
    tx.receive_timestamp = (uint64_t)(86400U * (365U * 70U + 17U)) << 32;
    tx.transmit_timestamp = (uint64_t)(86400U * (365U * 70U + 17U)) << 32;

    ntp_exchange(ntp_host, dst_ntp_port, &tx, &rx);

    if(rx.stratum == 0)
    {
        // Kiss of Death style packet!
        char *kod = (char*)&rx.reference_id;
        fprintf(stderr, "KoD received: %c%c%c%c", kod[0], kod[1], kod[2],
                kod[3]);
    }

    return rx.transmit_timestamp;
}

void ntp_exchange(const char* host, int port, struct ntp_packet *tx,
                  struct ntp_packet *rx)
{
    int sockfd, result;
    struct sockaddr_in dst_addr, src_addr;
    struct hostent *resolv;
    socklen_t dst_len;

    // Open the socket
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) 
        error("ERROR opening socket");

    // Resolve the server hostname
    resolv = gethostbyname(ntp_host);
    if (resolv == NULL) {
        fprintf(stderr,"ERROR, no such host as '%s'\n", ntp_host);
        exit(1);
    }

    // Build the destination address
    memset(&dst_addr, 0, sizeof(dst_addr));
    dst_addr.sin_family = AF_INET;
    memcpy(&dst_addr.sin_addr.s_addr, resolv->h_addr, resolv->h_length);
    dst_addr.sin_port = htons(port);

    // Build the source adddress
    memset(&src_addr, 0, sizeof(src_addr));
    src_addr.sin_family = AF_INET;
    src_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    src_addr.sin_port = htons(src_ntp_port);

    printf("Sending packet:\n");
    print_ntp_packet(tx);

    // Packet to network endian-ness
    hton_ntp(tx);

    // Bind to socket
    if(bind(sockfd, (struct sockaddr*)&src_addr, sizeof(src_addr)) < 0)
    {
        error("ERROR in bind");
        exit(1);
    }

    // Send the message to the server
    result = sendto(sockfd, tx, sizeof(struct ntp_packet), 0,
                    (struct sockaddr *)&dst_addr, sizeof(dst_addr));
    if (result < 0)
      error("ERROR in sendto");

    printf("Trying to receive...\n");
    dst_len = (socklen_t)sizeof(dst_addr);
    result = recvfrom(sockfd, rx, sizeof(struct ntp_packet), 0,
                      (struct sockaddr *)&dst_addr,
                      &dst_len);

    // Packet to machine endian-ness
    ntoh_ntp(rx);

    printf("Packet received:\n");
    print_ntp_packet(rx);

    if (result < 0) 
      error("ERROR in recvfrom");
}

int main()
{
    uint64_t ntp_time;
    printf("would you look at the time?\n");

    ntp_time = do_sntp();

    printf("On the third stroke, the time will be %llu.\n", ntp_time);
    time_t unixtime = ntp_to_unix(ntp_time);
    printf("ctime: %s\n", ctime(&unixtime));

    return 0;
}


