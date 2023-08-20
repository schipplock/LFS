#!/bin/bash
cat > /etc/shells << "EOF"
/bin/sh
/bin/bash
EOF

echo "done configuring shells"