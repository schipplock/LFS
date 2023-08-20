#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf kmod-30 \
 && tar xf kmod-30.tar.xz \
 && cd kmod-30 \
 && ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-openssl \
    --with-xz \
    --with-zstd \
    --with-zlib \
 && make \
 && make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

echo "done kmod"