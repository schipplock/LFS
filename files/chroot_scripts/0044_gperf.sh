#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gperf-3.1 \
 && tar xf gperf-3.1.tar.gz \
 && cd gperf-3.1 \
 && ./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1 \
 && make \
 && make install \
 && cd .. \
 && rm -rf gperf-3.1 \
 && echo "done gperf"