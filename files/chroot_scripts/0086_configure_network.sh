#!/bin/bash
cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
[Match]
Name=eno1

[Network]
DHCP=ipv4

[DHCP]
UseDomains=true
EOF

cat > /etc/resolv.conf << "EOF"
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF

echo "lfs" > /etc/hostname

cat > /etc/hosts << "EOF"
127.0.0.1 localhost
127.0.1.1 lfs

::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF

echo "done configuring network"