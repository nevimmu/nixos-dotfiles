{ inputs, ... }:

{
  imports = [
    inputs.jams.homeManagerModules.default
  ];

  programs.jams = {
    enable = true;
    autostart = true;
    musicPlayer = "spotify";
    browser = "firefox";
  };
}