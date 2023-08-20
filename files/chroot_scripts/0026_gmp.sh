#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gmp-6.2.1 \
 && tar xf gmp-6.2.1.tar.xz \
 && cd gmp-6.2.1 \
 && ./configure --prefix=/usr \
    --enable-cxx \
    --disable-static \
    --docdir=/usr/share/doc/gmp-6.2.1 \
 && make \
 && make html \
 && make check 2>&1 | tee gmp-check-log \
 && awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log \
 && make install \
 && make install-html \
 && cd .. \
 && rm -rf gmp-6.2.1 \
 && echo "done gmp"