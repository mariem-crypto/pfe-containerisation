FROM internetsystemsconsortium/bind9:9.18

COPY config/ /etc/bind/
COPY zones/ /etc/bind/zones/

EXPOSE 53/tcp 53/udp

CMD ["named", "-g", "-u", "bind"]
