{ pkgs, lib, config, ... }: 

let
	keybinds = import ./keybinds.nix;
	settings = import ./settings.nix;
	rules = import ./rules.nix;
	monitors = import ./monitors.nix;
	autostart = import ./autostart.nix;
in
{
	options = {
		hyprland.enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable Hyprland";
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