#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf mandoc-1.14.6 \
 && tar xf mandoc-1.14.6.tar.gz \
 && cd mandoc-1.14.6 \
 && ./configure \
 && make mandoc \
 && install -vm755 mandoc /usr/bin \
 && install -vm644 mandoc.1 /usr/share/man/man1 \
 && cd .. \
 && rm -rf mandoc-1.14.6 \
 && echo "done mandoc"