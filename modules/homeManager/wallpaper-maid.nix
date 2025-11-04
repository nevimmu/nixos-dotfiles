{ inputs, ... }:

{
  imports = [
    inputs.wallpaper-maid.homeManagerModules.default
  ];

  programs.wallpaper-maid = {
    enable = true;

		wallpapersDirectory = "/home/nev/dotfiles/wallpapers";

		# theme = {
		# 	enable = true;
		# };

		monitors = {
			"DP-1" = {
				suffix = "main";
				fps = 144;
			};
			"HDMI-A-1" = {
				suffix = "side";
				fps = 60;
			};
		};
  };
}