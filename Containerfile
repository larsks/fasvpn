FROM docker.io/alpine:latest

RUN apk add openconnect squid bash
COPY squid.conf /etc/squid/squid.conf
COPY connect.sh /connect.sh
CMD ["bash", "/connect.sh"]
