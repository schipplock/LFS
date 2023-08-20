#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf mpfr-4.1.0 \
 && rm -rf gmp-6.2.1 \
 && rm -rf mpc-1.2.1 \
 && rm -rf gcc-12.2.0 \
 && tar xf mpfr-4.1.0.tar.xz \
 && tar xf gmp-6.2.1.tar.xz \
 && tar xf mpc-1.2.1.tar.gz \
 && tar xf gcc-12.2.0.tar.xz \
 && mv -v mpfr-4.1.0 gcc-12.2.0/mpfr \
 && mv -v gmp-6.2.1 gcc-12.2.0/gmp \
 && mv -v mpc-1.2.1 gcc-12.2.0/mpc \
 && cd gcc-12.2.0 \
 && sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64 \
 && sed '/thread_header =/s/@.*@/gthr-posix.h/' -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in \
 && mkdir -v build \
 && cd build \
 && ../configure \
    --build=$(../config.guess) \
    --host=$LFS_TGT \
    --target=$LFS_TGT \
    LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc \
    --prefix=/usr \
    --with-build-sysroot=$LFS \
    --enable-initfini-array \
    --disable-nls \
    --disable-multilib \
    --disable-decimal-float \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --enable-languages=c,c++ \
 && make \
 && make DESTDIR=$LFS install \
 && ln -sv gcc $LFS/usr/bin/cc \
 && cd .. \
 && cd .. \
 && rm -rf gcc-12.2.0 \
 && rm -rf mpc-1.2.1 \
 && rm -rf gmp-6.2.1 \
 && rm -rf mpfr-4.1.0