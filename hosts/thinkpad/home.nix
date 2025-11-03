{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/homeManager/_default.nix
  ];

  # Thinkpad-specific monitor configuration
  hyprland.monitorsConfig = "thinkpad";
  
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
