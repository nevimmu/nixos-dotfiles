{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # calibre
    chromium
    discord
    melonds
    fastfetch
    firefox
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