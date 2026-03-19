#!/bin/bash

set -e

echo "=== keyd Custom Layout Installation for Arch Linux ==="
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root (use sudo)"
   exit 1
fi

# Update system packages
echo "[1/6] Updating system packages..."
pacman -Syu --noconfirm

# Install keyd and dependencies
echo "[2/6] Installing keyd and dependencies..."
pacman -S --noconfirm keyd

# Create keyd config directory if it doesn't exist
echo "[3/6] Setting up keyd configuration directory..."
mkdir -p /etc/keyd

# Create the custom keyboard layout configuration
echo "[4/6] Installing custom keyboard layout..."
cat > /etc/keyd/default.conf << 'EOF'
[ids]
*

[main]
# row 1
q = u
w = y
e = h
r = m
t = z
y = semicolon
u = c
i = g
o = f
p = p
[ = [
] = ]

# row 2
a = o
s = e
d = t
f = r
g = l
h = d
j = n
k = a
l = s
; = i
' = '

# row 3
z = comma
x = q
c = b
v = w
b = slash
n = dot
m = v
, = k
. = x
/ = j
EOF

# Enable and start keyd service
echo "[5/6] Enabling and starting keyd service..."
systemctl enable keyd
systemctl restart keyd

# Verify installation
echo "[6/6] Verifying installation..."
if systemctl is-active --quiet keyd; then
    echo ""
    echo "✓ Installation successful!"
    echo "✓ keyd service is running and enabled"
    echo ""
    echo "Configuration Details:"
    echo "  - Config file: /etc/keyd/default.conf"
    echo "  - Service: keyd.service (systemd)"
    echo "  - Status: $(systemctl is-active keyd)"
    echo ""
    echo "The custom layout will persist across reboots."
    echo ""
    echo "To check layout status: systemctl status keyd"
    echo "To view logs: journalctl -u keyd -f"
else
    echo "✗ Error: keyd service failed to start"
    echo "Check logs with: journalctl -u keyd -f"
    exit 1
fi
