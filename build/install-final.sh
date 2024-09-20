#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y vim gpg wget curl iproute2

apt-get install -y linux-headers-$(uname -r) linux-image-$(uname -r)

apt-get install -y \
    libbencode-perl \
    libcrypt-rijndael-perl \
    libdigest-hmac-perl \
    libio-socket-inet6-perl \
    libsocket6-perl \
    iptables \
    iptables-persistent \
    module-assistant \
    /*.deb

## Load rtpengine driver on kernel
modprobe xt_RTPENGINE

## Rtpengine packet forwarding to table=0
echo 'add 0' > /proc/rtpengine/control

apt-get clean; rm -rf /var/lib/apt/* /tmp/* /var/tmp/* /usr/share/doc/* /*.deb