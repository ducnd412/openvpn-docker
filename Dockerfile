# Smallest base image
FROM alpine:latest

MAINTAINER John Felten<john.felten@gmail.com>

ADD VERSION .

# Install needed packages
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update && apk add openssl easy-rsa openvpn iptables bash && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Configure tun
RUN mkdir -p /dev/net && \
     mknod /dev/net/tun c 10 200

