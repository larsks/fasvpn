FROM docker.io/alpine:latest

RUN apk add openconnect squid bash
COPY connect.sh /connect.sh
CMD ["bash", "/connect.sh"]
