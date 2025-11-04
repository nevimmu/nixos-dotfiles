{ pkgs, ... }:

{
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