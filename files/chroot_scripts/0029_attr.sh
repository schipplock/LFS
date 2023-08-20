#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf attr-2.5.1 \
 && tar xf attr-2.5.1.tar.gz \
 && cd attr-2.5.1 \
 && ./configure --prefix=/usr \
    --disable-static \
    --sysconfdir=/etc \
    --docdir=/usr/share/doc/attr-2.5.1 \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf attr-2.5.1 \
 && echo "done attr"