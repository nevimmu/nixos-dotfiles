# NixOS Nev Dotfiles

## 🖥️ System Configurations

This repository contains configurations for two systems:
- **BunnyGirl** (Desktop) - Main desktop with NVIDIA GPU support
- **OfficeLady** (ThinkPad) - Laptop configuration

## 📦 Features

- **Hyprland** - Modern Wayland compositor
- **Home Manager** - Declarative user environment management
- **Disko** - Declarative disk partitioning
- **SOPS** - Secrets management
- **Fish Shell** - User-friendly shell

## 🚀 Installation

### Fresh Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/nevimmu/nixos-dotfiles.git /tmp/dotfiles
   cd /tmp/dotfiles
   ```

2. **Set up disk partitioning** (choose your system):
   ```bash
   # For Desktop (adjust device path if needed)
   sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/desktop/disko.nix
   
   # For ThinkPad (adjust device path if needed)
   sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/thinkpad/disko.nix
   ```

3. **Generate hardware configuration (if new system)**:
   ```bash
   sudo nixos-generate-config --root /mnt --no-filesystems
   ```

4. **Copy hardware configuration**:
   ```bash
   # For Desktop
   sudo cp /mnt/etc/nixos/hardware-configuration.nix ./hosts/desktop/
   
   # For ThinkPad
   sudo cp /mnt/etc/nixos/hardware-configuration.nix ./hosts/thinkpad/
   ```

5. **Copy dotfiles to target system**:
   ```bash
   sudo cp -r . /mnt/etc/nixos/
   ```

6. **Install NixOS**:
   ```bash
   # For Desktop
   sudo nixos-install --root /mnt --flake /mnt/etc/nixos#BunnyGirl
   
   # For ThinkPad
   sudo nixos-install --root /mnt --flake /mnt/etc/nixos#OfficeLady
   ```

7. **Set user password**:
   ```bash
   sudo nixos-enter --root /mnt -c 'passwd nev'
   ```

8. **Reboot**:
   ```bash
   sudo reboot
   ```

### Post-Installation Setup

1. **Clone dotfiles to user directory**:
   ```bash
   cd ~
   git clone https://github.com/nevimmu/nixos-dotfiles.git dotfiles
   cd dotfiles
   ```

2. **Set up SOPS secrets** (optional):  
	Add secret key to `/var/lib/sops-nix/key.txt`

## 🔄 System Updates

### Update Flake Inputs

```bash
cd ~/dotfiles
nix flake update
```

### Rebuild System Configuration

```bash
nixos-rebuild --sudo switch --flake .#BunnyGirl
```

### Test Configuration Before Switching

```bash
# Test without switching
nixos-rebuild --sudo test --flake .#BunnyGirl
```

## 🔐 Secrets Management

This configuration uses SOPS-nix for secret management:

1. **Edit secrets**:
   ```bash
   sops secrets/secrets.yaml
   ```

2. **Add new secrets**: Update `modules/nixos/sops.nix`

## 🐛 Troubleshooting

### Rollback to Previous Generation

```bash
# List available generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Rollback to previous generation
nixos-rebuild --sudo switch --rollback
```

### Check Logs

```bash
# System logs
journalctl -f

# Hyprland logs
journalctl --user -f -u hyprland
```

### Rebuild from Scratch

```bash
# Clean rebuild
nixos-rebuild --sudo switch --flake .#BunnyGirl --option eval-cache false
```

## 📁 Directory Structure

```
├── flake.nix                # Main flake configuration
├── hosts/                   # Host-specific configurations
│   ├── desktop/             # Desktop configuration
│   └── thinkpad/            # Laptop configuration
├── modules/                 # Reusable modules
│   ├── homeManager/         # Home manager modules
│   └── nixos/               # NixOS system modules
├── secrets/                 # SOPS encrypted secrets
└── wallpapers/              # Desktop backgrounds
```