{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/homeManager/_default.nix
  ];

  # Desktop-specific monitor configuration
  hyprland.monitorsConfig = "desktop";

  affinity.enable = true;
  ollama.enable = true;
  
}
