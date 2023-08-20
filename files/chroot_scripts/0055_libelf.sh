#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf elfutils-0.187 \
 && tar xf elfutils-0.187.tar.bz2 \
 && cd elfutils-0.187 \
 && ./configure --prefix=/usr \
    --disable-debuginfod \
    --enable-libdebuginfod=dummy \
 && make \
 && make -C libelf install \
 && install -vm644 config/libelf.pc /usr/lib/pkgconfig \
 && rm /usr/lib/libelf.a \
 && cd .. \
 && rm -rf elfutils-0.187 \
 && echo "done libelf"