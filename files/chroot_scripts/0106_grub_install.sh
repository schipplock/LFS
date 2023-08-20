#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mount -t efivarfs none /sys/firmware/efi/efivars
mkdir -p /boot/efi
mount /dev/nvme1n1p1 /boot/efi
grub-install /dev/nvme1n1

cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2
insmod all_video

set root=(hd0,3)

menuentry "GNU/Linux, Linux 5.19.2-lfs-11.2-systemd" {
    linux /boot/vmlinuz-5.19.2-lfs-11.2-systemd root=/dev/nvme1n1p3 ro
}
EOF

grub-mkconfig -o /boot/grub/grub.cfg

echo "done grub"