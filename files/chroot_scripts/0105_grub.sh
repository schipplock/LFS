#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf grub-2.06 \
 && tar xf grub-2.06.tar.xz \
 && cd grub-2.06 \
 && ./configure --prefix=/usr --sysconfdir=/etc --disable-efiemu --with-platform=efi --disable-werror \
 && make \
 && make install \
 && mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions \
 && cd .. \
 && rm -rf grub-2.06 \
 && echo "done grub"