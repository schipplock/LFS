#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

filename=procps-ng-4.0.0.tar.xz

extension=.$(echo ${filename} | awk -F'[.]' '{print $(NF-1)"."$NF}')
directory=$(basename ${filename} ${extension})

cd sources \
 && rm -rf ${directory} \
 && tar xf ${filename} \
 && cd ${directory} \
 && ./configure --prefix=/usr \
    --docdir=/usr/share/doc/procps-ng-4.0.0 \
    --disable-static \
    --disable-kill \
    --with-systemd \
 && make \
 && make install \
 && cd .. \
 && rm -rf ${directory} \
 && echo "done ${directory}"