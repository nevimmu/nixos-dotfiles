{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/homeManager/_default.nix
  ];

  # Thinkpad-specific monitor configuration
  hyprland.monitorsConfig = "thinkpad";
  
}
