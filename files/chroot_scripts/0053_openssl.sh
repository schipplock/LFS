#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf openssl-3.0.5 \
 && tar xf openssl-3.0.5.tar.gz \
 && cd openssl-3.0.5 \
 && ./config --prefix=/usr \
    --openssldir=/etc/ssl \
    --libdir=lib \
    shared \
    zlib-dynamic \
 && make \
 && sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile \
 && make MANSUFFIX=ssl install \
 && mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.5 \
 && cp -vfr doc/* /usr/share/doc/openssl-3.0.5 \
 && cd .. \
 && rm -rf openssl-3.0.5 \
 && echo "done openssl"