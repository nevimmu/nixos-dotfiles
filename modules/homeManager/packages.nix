{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    fastfetch
    firefox
    freecad
    gcc
    imv
    kdePackages.filelight
    kicad
    mpv
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