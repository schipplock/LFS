#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf less-590 \
 && tar xf less-590.tar.gz \
 && cd less-590 \
 && ./configure --prefix=/usr --sysconfdir=/etc \
 && make \
 && make install \
 && cd .. \
 && rm -rf less-590 \
 && echo "done less"