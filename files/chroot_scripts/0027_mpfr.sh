#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf mpfr-4.1.0 \
 && tar xf mpfr-4.1.0.tar.xz \
 && cd mpfr-4.1.0 \
 && ./configure --prefix=/usr \
    --disable-static \
    --enable-thread-safe \
    --docdir=/usr/share/doc/mpfr-4.1.0 \
 && make \
 && make html \
 && make check \
 && make install \
 && make install-html \
 && cd .. \
 && rm -rf mpfr-4.1.0 \
 && echo "done mpfr"