{ inputs, lib, config, ... }:

let
	monitorsProfile = config.hyprland.monitorsConfig or null;
	
	# Desktop monitor configuration
	desktopMonitors = {
		"DP-1" = {
			suffix = "main";
			fps = 144;
		};
		"HDMI-A-1" = {
			suffix = "side";
			fps = 60;
		};
	};
	
	# Thinkpad monitor configuration
	thinkpadMonitors = {
		"eDP-1" = {
			suffix = "main";
			fps = 60;
		};
	};
	
	# Select monitors based on profile
	selectedMonitors = if monitorsProfile == "desktop" then desktopMonitors
										else if monitorsProfile == "thinkpad" then thinkpadMonitors
										else desktopMonitors; # fallback to desktop
in
{
	imports = [
		inputs.wallpaper-maid.homeManagerModules.default
	];

	programs.wallpaper-maid = {
		enable = true;

		wallpapersDirectory = "/home/nev/dotfiles/wallpapers";

		monitors = selectedMonitors;
	};
}