#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf zstd-1.5.2 \
 && tar xf zstd-1.5.2.tar.gz \
 && cd zstd-1.5.2 \
 && patch -Np1 -i ../zstd-1.5.2-upstream_fixes-1.patch \
 && make prefix=/usr \
 && make check \
 && make prefix=/usr install \
 && rm -v /usr/lib/libzstd.a \
 && cd .. \
 && rm -rf zstd-1.5.2 \
 && echo "done zstd"