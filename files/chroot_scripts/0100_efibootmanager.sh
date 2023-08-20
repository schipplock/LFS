#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf efibootmgr-18 \
 && tar xf efibootmgr-18.tar.gz \
 && cd efibootmgr-18 \
 && make EFIDIR=LFS EFI_LOADER=grubx64.efi \
 && make install EFIDIR=LFS \
 && cd .. \
 && rm -rf efibootmgr-18 \
 && echo "done efibootmanager"