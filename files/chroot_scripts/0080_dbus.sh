#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

filename=dbus-1.14.0.tar.xz

extension=.$(echo ${filename} | awk -F'[.]' '{print $(NF-1)"."$NF}')
directory=$(basename ${filename} ${extension})

cd sources \
 && rm -rf ${directory} \
 && tar xf ${filename} \
 && cd ${directory} \
 && ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run \
    --disable-static \
    --disable-doxygen-docs \
    --disable-xml-docs \
    --docdir=/usr/share/doc/dbus-1.14.0 \
    --with-system-socket=/run/dbus/system_bus_socket \
 && make \
 && make install \
 && ln -sfv /etc/machine-id /var/lib/dbus \
 && cd .. \
 && rm -rf ${directory} \
 && echo "done ${directory}"