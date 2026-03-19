# keyd Custom Keyboard Layout for Arch Linux

A one-command installation script for setting up [keyd](https://github.com/rvaiya/keyd) with a custom keyboard layout on Arch Linux. This configuration remaps your entire keyboard to a custom layout and persists across reboots.

## Features

✨ **One-command installation** - Downloads, configures, and enables keyd automatically  
🔧 **Custom keyboard layout** - Predefined remapping for all keys  
🚀 **Systemwide & persistent** - Works across all applications and survives reboots  
🛡️ **Automated setup** - No manual configuration needed  
📋 **Verification included** - Script checks if installation was successful  

## Prerequisites

- **Arch Linux** or Arch-based distro (Manjaro, EndeavourOS, etc.)
- **sudo** privileges (script runs as root)
- **Internet connection** (to download keyd from official repos)

## Installation

### Quick Start (One Command)

```bash
curl -fsSL https://raw.githubusercontent.com/Tanvir-7/RSTLN-layout-setup/main/install.sh | sudo bash
```

Or download and run manually:

```bash
git clone https://github.com/Tanvir-7/RSTLN-layout-setup.git
cd RSTLN-layout-setup
sudo chmod +x install.sh
sudo ./install.sh
```

### What the Script Does

1. ✅ Verifies root privileges
2. ✅ Updates system packages (`pacman -Syu`)
3. ✅ Installs `keyd` from official Arch repositories
4. ✅ Creates `/etc/keyd/default.conf` with your custom layout
5. ✅ Enables `keyd.service` in systemd
6. ✅ Starts the keyd service immediately
7. ✅ Verifies successful installation

## Keyboard Layout

This script applies the following custom keyboard layout:

### Row 1
```
q → u    w → y    e → h    r → m    t → z
y → ;    u → c    i → g    o → f    p → p
[ → [    ] → ]
```

### Row 2
```
a → o    s → e    d → t    f → r    g → l
h → d    j → n    k → a    l → s    ; → i
' → '
```

### Row 3
```
z → ,    x → q    c → b    v → w    b → /
n → .    m → v    , → k    . → x    / → j
```

## Usage

### Check Status

```bash
systemctl status keyd
```

### View Live Logs

```bash
journalctl -u keyd -f
```

### Restart Service

```bash
sudo systemctl restart keyd
```

### View Configuration

```bash
cat /etc/keyd/default.conf
```

## Configuration File Location

The configuration is stored at:

```
/etc/keyd/default.conf
```

To edit the layout manually:

```bash
sudo nano /etc/keyd/default.conf
```

After editing, restart the service:

```bash
sudo systemctl restart keyd
```

## Uninstallation

To remove keyd and disable the custom layout:

```bash
sudo systemctl stop keyd
sudo systemctl disable keyd
sudo pacman -R keyd
sudo rm /etc/keyd/default.conf
```

## Troubleshooting

### Service won't start

Check the systemd logs:

```bash
journalctl -u keyd -n 50
```

### Layout not working

Verify keyd is running:

```bash
systemctl is-active keyd
```

If inactive, restart it:

```bash
sudo systemctl restart keyd
```

### Want to temporarily disable

```bash
sudo systemctl stop keyd
```

### Want to re-enable

```bash
sudo systemctl start keyd
```

## Reboot Persistence

✅ **Automatic reboot-proof setup**

The script enables keyd as a systemd service, which means:
- Keyd starts automatically on boot
- Your custom layout is applied instantly
- No manual intervention needed after installation

You can verify this by checking:

```bash
systemctl is-enabled keyd
# Output: enabled
```

## System Requirements

| Requirement | Version |
|------------|---------|
| OS | Arch Linux or derivative |
| keyd | Latest from official repos |
| systemd | (standard on Arch) |
| bash | 4.0+ |

## Script Details

- **Size**: ~1.8 KB
- **Runtime**: ~1-2 minutes (depending on internet speed)
- **Requires root**: Yes (for system-wide configuration)
- **Network access**: Yes (to download keyd from pacman repos)

## References

- [keyd GitHub Repository](https://github.com/rvaiya/keyd)
- [Arch Linux Wiki - Keyd](https://wiki.archlinux.org/title/Keyd)
- [systemd Services](https://wiki.archlinux.org/title/Systemd)

## License

This installation script is provided as-is. keyd itself is licensed under the MIT License.

## Support

If you encounter issues:

1. Check the troubleshooting section above
2. Review systemd logs: `journalctl -u keyd`
3. Open an issue on this repository

## Contributing

Found a bug? Want to improve the layout? Feel free to:

1. Fork this repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

**Made for Arch Linux users who want customizable keyboard remapping without hassle.** ⌨️
