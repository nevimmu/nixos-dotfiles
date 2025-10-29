{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/default.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Set HostName
  networking.hostName = "BunnyGirl"; # Define your hostname.

  # Enable NVIDIA drivers.
  nvidia.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nev = {
    isNormalUser = true;
    description = "nev";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  tree
    ];
  };

  programs.fish.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      nev = import ./home.nix;
    };
  };

  # Install firefox.
  programs.firefox.enable = true;
}
