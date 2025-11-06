{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-your-shell
  ];
}