#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf iproute2-5.19.0 \
 && tar xf iproute2-5.19.0.tar.xz \
 && cd iproute2-5.19.0 \
 && sed -i /ARPD/d Makefile \
 && rm -fv man/man8/arpd.8 \
 && make NETNS_RUN_DIR=/run/netns \
 && make SBINDIR=/usr/sbin install \
 && mkdir -pv /usr/share/doc/iproute2-5.19.0 \
 && cp -v COPYING README* /usr/share/doc/iproute2-5.19.0 \
 && cd .. \
 && rm -rf iproute2-5.19.0 \
 && echo "done iproute2"