#!/bin/bash
cat > /etc/locale.conf << "EOF"
LANG=de_DE.UTF-8
EOF

echo "done configuring locale"