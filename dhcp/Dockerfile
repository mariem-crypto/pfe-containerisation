FROM ubuntu:22.04

RUN apt-get update && apt-get install -y isc-dhcp-server \
    && mkdir -p /var/lib/dhcp \
    && touch /var/lib/dhcp/dhcpd.leases \
    && chown -R dhcpd:dhcpd /var/lib/dhcp

COPY dhcpd.conf /etc/dhcp/dhcpd.conf

CMD ["dhcpd", "-f", "-d"]
