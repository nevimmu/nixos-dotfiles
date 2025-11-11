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

5. **Prepare flake for installation**:
   ```bash
   # Comment out the private font repository input (requires SSH)
   # Edit flake.nix and comment out line 9:
   sed -i 's/^    cartographcf-nf/#    cartographcf-nf/' /tmp/dotfiles/flake.nix
   ```

6. **Copy dotfiles to target system**:
   ```bash
   sudo cp -r . /mnt/etc/nixos/
   ```

7. **Set up SOPS secrets (REQUIRED before installation)**:
   ```bash
   # Create the sops-nix key directory
   sudo mkdir -p /mnt/var/lib/sops-nix
   
   # Copy your age key to the target system
   # If you don't have a key yet, generate one:
   # nix-shell -p age --run "age-keygen -o age-key.txt"
   sudo cp /path/to/your/age-key.txt /mnt/var/lib/sops-nix/key.txt
   sudo chmod 600 /mnt/var/lib/sops-nix/key.txt
   
   # IMPORTANT: The system will install without decrypted secrets on first run
   # Secrets will be activated on the first rebuild after installation
   ```

8. **Install NixOS**:
   ```bash
   # For Desktop
   sudo nixos-install --root /mnt --flake /mnt/etc/nixos#BunnyGirl
   
   # For ThinkPad
   sudo nixos-install --root /mnt --flake /mnt/etc/nixos#OfficeLady
   ```

9. **Set user password**:
   ```bash
   sudo nixos-enter --root /mnt -c 'passwd nev'
   ```

10. **Reboot**:
   ```bash
   sudo reboot
   ```

### Post-Installation Setup

After your first boot:

1. **Clone dotfiles to user directory**:
   ```bash
   cd ~
   git clone https://github.com/nevimmu/nixos-dotfiles.git dotfiles
   cd dotfiles
   ```

2. **Set up SSH keys and decrypt secrets**:
   ```bash
   # Your SSH keys will now be available via sops-nix secrets
   # Uncomment the cartographcf-nf line in flake.nix
   sed -i 's/^#    cartographcf-nf/    cartographcf-nf/' ~/dotfiles/flake.nix
   
   # Update flake lock to fetch the private font repo
   nix flake update
   
   # Rebuild to activate all features including the custom font
   sudo nixos-rebuild switch --flake .#YourHostName
   ```
   ```

2. **Set up SSH keys for private repos** (if using cartographcf-nf font):
   ```bash
   # Copy your SSH keys to ~/.ssh/
   # Ensure they have correct permissions
   chmod 600 ~/.ssh/id_*
   
   # Test GitHub SSH access
   ssh -T git@github.com
   
   # Uncomment the font in flake.nix line 9 and modules/nixos/configuration.nix
   # Then rebuild:
   nixos-rebuild --sudo switch --flake .#BunnyGirl
   ```

3. **Verify home-manager applied correctly**:
   ```bash
   # Check if home-manager files exist
   ls -la ~/.config/
   
   # If missing, rebuild to apply home-manager
   nixos-rebuild --sudo switch --flake /etc/nixos#BunnyGirl
   ```

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

### Fresh Installation Issues

#### Private Font Repository Fails
**Problem**: Installation fails with errors about `cartographcf-nf` or SSH access.

**Solution**:
1. During fresh install, comment out line 9 in `flake.nix`:
   ```nix
   # cartographcf-nf.url = "git+ssh://git@github.com/nevimmu/CartographCFNerdFont.git";
   ```
2. The font package is now optional in `modules/nixos/configuration.nix` and will be skipped if unavailable
3. After installation, set up SSH keys and uncomment to enable the font

#### Home-Manager Configuration Not Applied
**Problem**: After installation, home-manager dotfiles (hyprland, waybar, etc.) are missing.

**Solutions**:
1. **Check if secrets are set up**: Home-manager may fail if secrets aren't available
   ```bash
   # Verify key exists
   sudo cat /var/lib/sops-nix/key.txt
   
   # Check sops can decrypt
   sops -d /etc/nixos/secrets/secrets.yaml
   ```

2. **Rebuild to apply home-manager**:
   ```bash
   sudo nixos-rebuild switch --flake /etc/nixos#BunnyGirl
   ```

3. **Check home-manager logs**:
   ```bash
   journalctl -u home-manager-nev.service
   ```

4. **Manual home-manager activation** (if needed):
   ```bash
   # Check current user's home-manager
   systemctl --user status home-manager.service
   ```

#### Secrets Not Working
**Problem**: System builds but secrets aren't decrypted or SSH configs missing.

**Solution**:
1. Ensure age key is in place BEFORE `nixos-install`:
   ```bash
   sudo mkdir -p /mnt/var/lib/sops-nix
   sudo cp your-age-key.txt /mnt/var/lib/sops-nix/key.txt
   sudo chmod 600 /mnt/var/lib/sops-nix/key.txt
   ```

2. Verify your `secrets/secrets.yaml` is encrypted with the correct age public key:
   ```bash
   # Get public key from private key
   nix-shell -p age --run "age-keygen -y /var/lib/sops-nix/key.txt"
   
   # Update .sops.yaml with this public key, then re-encrypt secrets
   sops updatekeys secrets/secrets.yaml
   ```

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