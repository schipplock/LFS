#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf pkg-config-0.29.2 \
 && tar xf pkg-config-0.29.2.tar.gz \
 && cd pkg-config-0.29.2 \
 && ./configure --prefix=/usr \
    --with-internal-glib \
    --disable-host-tool \
    --docdir=/usr/share/doc/pkg-config-0.29.2 \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf pkg-config-0.29.2 \
 && echo "done pkg-config"