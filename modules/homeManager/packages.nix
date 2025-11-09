{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    fastfetch
    freecad
    gcc
    imv
    kdePackages.filelight
    kicad
    nautilus
    neovim
    nixpkgs-fmt
    rose-pine-cursor
    spotify
    starship
    swww
    vim
    vscode
    wget
    yazi
    zoxide
  ];
}