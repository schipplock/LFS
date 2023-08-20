#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf flex-2.6.4 \
 && tar xf flex-2.6.4.tar.gz \
 && cd flex-2.6.4 \
 && ./configure --prefix=/usr \
    --docdir=/usr/share/doc/flex-2.6.4 \
    --disable-static \
 && make \
 && make check \
 && make install \
 && ln -sv flex /usr/bin/lex \
 && cd .. \
 && rm -rf flex-2.6.4 \
 && echo "done flex"