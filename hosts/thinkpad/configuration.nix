{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./disko.nix
      ../../modules/nixos/default.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Set HostName
  networking.hostName = "OfficeLady";

  # Enable NVIDIA drivers.
  nvidia.enable = true;

  # Enable Hyprland window manager with XWayland support.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.fish.enable = true;
  programs.firefox.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.nev = {
    isNormalUser = true;
    description = "nev";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      nev = import ./home.nix;
    };
  };
}
