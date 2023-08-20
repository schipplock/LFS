#!/bin/bash

# disable screen clearing after boot
mkdir -pv /etc/systemd/system/getty@tty1.service.d
cat > /etc/systemd/system/getty@tty1.service.d/noclear.conf << EOF
[Service]
TTYVTDisallocate=no
EOF

# disable tmpfs for /tmp
ln -sfv /dev/null /etc/systemd/system/tmp.mount

# limit core-dump size
mkdir -pv /etc/systemd/coredump.conf.d
cat > /etc/systemd/coredump.conf.d/maxuse.conf << EOF
[Coredump]
MaxUse=5G
EOF

echo "done configuring systemd"