{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    fastfetch
    gcc
    imv
    kdePackages.filelight
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