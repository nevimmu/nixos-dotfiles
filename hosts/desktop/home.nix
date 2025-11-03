{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/homeManager/default.nix
  ];

  # Desktop-specific monitor configuration
  hyprland.monitorsConfig = "desktop";
  
  home.packages = with pkgs; [
    vim
    zoxide
    starship
    fastfetch
    wget
    swww
    neovim
    discord
    spotify
    nixpkgs-fmt
    gcc
    yazi
    nautilus
    vscode
    kdePackages.filelight
    hyprshot
    rose-pine-cursor
  ];
}
