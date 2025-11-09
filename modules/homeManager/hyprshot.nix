{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.hyprshot.packages.x86_64-linux.default
  ];
}