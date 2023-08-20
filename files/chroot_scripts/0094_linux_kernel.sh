#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf linux-5.19.2 \
 && tar xf linux-5.19.2.tar.xz \
 && cd linux-5.19.2 \
 && make mrproper \
 && make defconfig \
 && cp /sources/kernel_config .config \
 && echo "enter chroot now and configure the kernel:" \
 && echo "> sudo ./0011_chroot_enter.sh" \
 && echo "> cd sources/linux-5.19.2" \
 && echo "> make menuconfig" \
 && echo "> make -j4" \
 && echo "> make modules_install" \
 && echo "> cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.19.2-lfs-11.2-systemd" \
 && echo "> cp -iv System.map /boot/System.map-5.19.2" \
 && echo "> cp -iv .config /boot/config-5.19.2" \
 && echo "> install -d /usr/share/doc/linux-5.19.2" \
 && echo "> cp -r Documentation/* /usr/share/doc/linux-5.19.2" \
 && echo "> chown -R 0:0 ." \
 && echo "> exit"