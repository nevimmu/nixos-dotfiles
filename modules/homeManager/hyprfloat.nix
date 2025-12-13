{ inputs, lib, config, ... }:

let
	monitorsProfile = config.hyprland.monitorsConfig or null;
	
	# Desktop monitor configuration
	desktopMonitors = {
		"DP-1" = {
			width = 1818;
			height = 1023;
			offset = [0 0];
		};
		"HDMI-A-1" = {
			width = 767;
			height = 1364;
			offset = [0 0];
		};
	};
	
	# Thinkpad monitor configuration
	thinkpadMonitors = {
		"eDP-1" = {
			width = 1364;
			height = 767;
			offset = [0 0];
		};
	};
	
	# Select monitors based on profile
	selectedMonitors = if monitorsProfile == "desktop" then desktopMonitors
										else if monitorsProfile == "thinkpad" then thinkpadMonitors
										else desktopMonitors; # fallback to desktop
in
{
	imports = [
		inputs.hyprfloat.homeManagerModules.default
	];

	services.hyprfloat = {
		enable = true;

		settings = {
			terminal_classes = [
				"kitty"
				"com.mitchellh.ghostty"
				"mpv"
				"imv"
				"org.gnome.Nautilus"
				"org.kde.filelight"
				"org.prismlauncher.PrismLauncher"
			];

			ignore_titles = [
				"notificationtoasts_\\d+_desktop"
				"DVD"
				"— Prism Launcher"
			];

			monitors = selectedMonitors;
		};
	};

}