#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf linux-5.19.2 \
 && tar xf linux-5.19.2.tar.xz \
 && cd linux-5.19.2 \
 && make mrproper \
 && make headers \
 && find usr/include -type f ! -name '*.h' -delete \
 && cp -rv usr/include $LFS/usr \
 && cd .. \
 && rm -rf linux-5.19.2