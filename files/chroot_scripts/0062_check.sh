#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf check-0.15.2 \
 && tar xf check-0.15.2.tar.gz \
 && cd check-0.15.2 \
 && ./configure --prefix=/usr --disable-static \
 && make \
 && make docdir=/usr/share/doc/check-0.15.2 install \
 && cd .. \
 && rm -rf check-0.15.2 \
 && echo "done check"