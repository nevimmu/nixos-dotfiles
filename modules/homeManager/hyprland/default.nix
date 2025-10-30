{ pkgs, lib, config, ... }: 

let
	keybinds = import ./keybinds.nix;
	settings = import ./settings.nix;
	rules = import ./rules.nix;
	autostart = import ./autostart.nix;
	
	# Import the appropriate monitor configuration based on the host
	monitors = 
		if config.hyprland.monitorsConfig != null 
		then import (./monitors + "/${config.hyprland.monitorsConfig}.nix")
		else import ./monitors.nix;
in
{
	options = {
		hyprland.enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable Hyprland";
		};

		hyprland.monitorsConfig = lib.mkOption {
			type = lib.types.nullOr lib.types.str;
			default = null;
			description = "Monitor configuration profile to use (e.g., 'desktop' or 'thinkpad')";
		};
	};

	config = lib.mkIf config.hyprland.enable {
		wayland.windowManager.hyprland.enable = true;

		wayland.windowManager.hyprland.settings = {
			# Environment variables
			"$terminal" = "kitty";
			"$fileManager" = "nautilus";
			"$menu" = "rofi -show drun";
		}

		// monitors    # Monitor and workspace configuration
		// autostart   # Programs to run on startup
		// settings    # General settings, decorations, animations, input
		// keybinds    # All keybindings
		// rules;      # Window, layer rules
	};
}