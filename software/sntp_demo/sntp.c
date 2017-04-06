#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdint.h>
#include <time.h>

//const char* ntp_host = "ntp1.leontp.com";
const char* ntp_host = "2.uk.pool.ntp.org";
const int ntp_port = 123;


struct ntp_packet {
    // 32-bit packed word of state bits
    unsigned int leap_indicator: 2;
    unsigned int ntp_version: 3;
    unsigned int packet_mode: 3;
    unsigned int stratum: 8;
    unsigned int poll_interval: 8;
    signed int precision: 8;

    // Word-aligned fields
    uint32_t root_delay;
    uint32_t root_dispersion;
    uint32_t reference_id;
    uint32_t reference_timestamp[2];
    uint32_t origin_timestamp[2];
    uint32_t receive_timestamp[2];
    uint32_t transmit_timestamp[2];
};

uint32_t do_sntp(void);
void ntp_exchange(const char* host, int port, struct ntp_packet *tx,
                  struct ntp_packet *rx);

void error(char *msg) {
    perror(msg);
    exit(1);
}

time_t ntp_to_unix(uint32_t ntp_timestamp)
{
    const uint32_t unix_epoch_in_ntp = 2208988800u;
    return ntp_timestamp - unix_epoch_in_ntp;
}

void print_ntp_timestamp(uint32_t ntp_timestamp)
{
    time_t unixtime = ntp_to_unix(ntp_timestamp);
    puts(ctime(&unixtime));
}


void print_ntp_packet(struct ntp_packet *packet)
{
    printf("Leap indicator: %u\n", packet->leap_indicator);
    printf("NTP version: %u\n", packet->ntp_version);
    printf("Packet mode: %u\n", packet->packet_mode);
    printf("Stratum: %u\n", packet->stratum);
    printf("Poll interval: %u\n", packet->poll_interval);
    printf("Precision: %i\n", packet->precision);
    printf("Root delay: %u\n", packet->root_delay);
    printf("Root dispersion: %u\n", packet->root_dispersion);
    printf("Reference ID: %u\n", packet->reference_id);
    print_ntp_timestamp(packet->reference_timestamp[0]);
    print_ntp_timestamp(packet->origin_timestamp[0]);
    print_ntp_timestamp(packet->receive_timestamp[0]);
    print_ntp_timestamp(packet->transmit_timestamp[0]);


}

void hton_mem(void* object, size_t len)
{
    // Do htonl on each uint32_t word in object.
    int count = len / sizeof(uint32_t);
    for(int i=0; i<count; i++)
        *((uint32_t*)object + i) = htonl(*((uint32_t*)object + i));
}

void ntoh_mem(void* object, size_t len)
{
    // Do ntohl on each uint32_t word in object.
    int count = len / sizeof(uint32_t);
    for(int i=0; i<count; i++)
        *((uint32_t*)object + i) = ntohl(*((uint32_t*)object + i));
}

// Returns NTP timestamp. Ish.
uint32_t do_sntp(void)
{
    struct ntp_packet tx, rx;

    memset(&tx, 0, sizeof(tx));
    memset(&rx, 0, sizeof(rx));

    tx.leap_indicator = 3;      // Leap unknown (unsynchronised)
    tx.ntp_version = 4;         // NTP v4
    tx.packet_mode = 3;         // Client packet
    tx.stratum = 16;            // Stratum 16: unsynchronised
    tx.poll_interval = 12;      // 2^10 second poll interval
    tx.precision = 0;           // 2^0 second clock precision

    // Set all timestamps to a reasonable baseline
    tx.origin_timestamp[0] = 86400U * (365U * 115U + 17U);
    tx.reference_timestamp[0] = 86400U * (365U * 115U + 17U);
    tx.receive_timestamp[0] = 86400U * (365U * 115U + 17U);
    tx.transmit_timestamp[0] = 86400U * (365U * 115U + 17U);

    ntp_exchange(ntp_host, ntp_port, &tx, &rx);

    if(rx.stratum == 0)
    {
        // Kiss of Death style packet!
        char *kod = (char*)&rx.reference_id;
        fprintf(stderr, "KoD received: %c%c%c%c", kod[0], kod[1], kod[2],
                kod[3]);
    }

    return rx.transmit_timestamp[0];
}

void ntp_exchange(const char* host, int port, struct ntp_packet *tx,
                  struct ntp_packet *rx)
{
    int sockfd, result, dest_len;
    struct sockaddr_in serveraddr;
    struct hostent *server;

    // Open the socket
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) 
        error("ERROR opening socket");

    // Resolve the server hostname
    server = gethostbyname(ntp_host);
    if (server == NULL) {
        fprintf(stderr,"ERROR, no such host as '%s'\n", ntp_host);
        exit(0);
    }

    // Build the server's Internet address */
    memset(&serveraddr, 0, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    memcpy(&serveraddr.sin_addr.s_addr, server->h_addr, server->h_length);
    serveraddr.sin_port = htons(ntp_port);
    dest_len = sizeof(serveraddr);

    printf("Sending packet:\n");
    print_ntp_packet(tx);

    // Packet to network endian-ness
    hton_mem(tx, sizeof(struct ntp_packet));

    // Send the message to the server
    result = sendto(sockfd, tx, sizeof(struct ntp_packet), 0,
                    (struct sockaddr *)&serveraddr, dest_len);
    if (result < 0)
      error("ERROR in sendto");

    printf("Trying to receive...\n");
    result = recvfrom(sockfd, rx, sizeof(struct ntp_packet), 0,
                      (struct sockaddr *)&serveraddr,
                      (socklen_t *)&dest_len);

    // Packet to machine endian-ness
    ntoh_mem(rx, sizeof(struct ntp_packet));

    printf("Packet received:\n");
    print_ntp_packet(rx);

    if (result < 0) 
      error("ERROR in recvfrom");
}

int main()
{
    uint32_t ntp_time;
    printf("would you look at the time?\n");

    ntp_time = do_sntp();

    printf("On the third stroke, the time will be %u.\n", ntp_time);
    time_t unixtime = ntp_to_unix(ntp_time);
    printf("ctime: %s\n", ctime(&unixtime));

    return 0;
}


