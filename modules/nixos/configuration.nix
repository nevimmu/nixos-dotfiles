{ config, pkgs, inputs, ... }:

{
	# Packages
  environment.systemPackages = with pkgs; [
    git
  ];

  # Systemd Journal configuration
	services.journald.extraConfig = "SystemMaxUse=1G";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

	# Set locale and time zone
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # wheel group gets trusted access to nix daemon
  nix.settings.trusted-users = [ "@wheel" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

	# Silent Boot
	# https://wiki.archlinux.org/title/Silent_boot
	boot.kernelParams = [
		"quiet"
		"splash"
		"vga=current"
		"rd.systemd.show_status=false"
		"rd.udev.log_level=3"
		"udev.log_priority=3"
	];
	boot.initrd.systemd.enable = true;
	boot.initrd.verbose = false;
	boot.plymouth.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # Did you read the comment?
}