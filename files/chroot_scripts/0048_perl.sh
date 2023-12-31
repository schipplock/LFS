#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export BUILD_ZLIB=False
export BUILD_BZIP2=0

cd sources \
 && rm -rf perl-5.36.0 \
 && tar xf perl-5.36.0.tar.xz \
 && cd perl-5.36.0 \
 && sh Configure -des \
    -Dprefix=/usr \
    -Dvendorprefix=/usr \
    -Dprivlib=/usr/lib/perl5/5.36/core_perl \
    -Darchlib=/usr/lib/perl5/5.36/core_perl \
    -Dsitelib=/usr/lib/perl5/5.36/site_perl \
    -Dsitearch=/usr/lib/perl5/5.36/site_perl \
    -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl \
    -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl \
    -Dman1dir=/usr/share/man/man1 \
    -Dman3dir=/usr/share/man/man3 \
    -Dpager="/usr/bin/less -isR" \
    -Duseshrplib \
    -Dusethreads \
 && make \
 && make install \
 && unset BUILD_ZLIB BUILD_BZIP2 \
 && cd .. \
 && rm -rf perl-5.36.0 \
 && echo "done perl"