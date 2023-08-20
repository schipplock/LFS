#!/bin/bash

cat > /etc/fstab << "EOF"
/dev/nvme1n1p3 / ext4 defaults 1 1
/dev/nvme1n1p2 swap swap pri=1 0 0
EOF

echo "done creating /etc/fstab"