#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf binutils-2.39 \
 && tar xf binutils-2.39.tar.xz \
 && cd binutils-2.39 \
 && mkdir -v build \
 && cd build \
 && ../configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gold \
    --enable-ld=default \
    --enable-plugins \
    --enable-shared \
    --disable-werror \
    --enable-64-bit-bfd \
    --with-system-zlib \
 && make tooldir=/usr \
 && make tooldir=/usr install \
 && rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a \
 && cd .. \
 && cd .. \
 && rm -rf binutils-2.39 \
 && echo "done binutils"