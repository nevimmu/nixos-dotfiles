{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/homeManager/_default.nix
  ];

  # Desktop-specific monitor configuration
  hyprland.monitorsConfig = "desktop";

  # Enable MangoWC configuration
  mango.enable = true;

  affinity.enable = true;
  
}
