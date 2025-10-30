{ pkgs, lib, config, ... }:

let
  monitorsProfile = config.hyprland.monitorsConfig or null;
  selectedOutput = if monitorsProfile == "desktop" then "DP-1"
				   else if monitorsProfile == "thinkpad" then "eDP-1"
				   else "DP-1"; # fallback
  persistentForOutput = builtins.listToAttrs [
	{ name = selectedOutput; value = [ "1" "2" "3" "4" "5" ]; }
  ];
in
{
	home.file = {
		".config/waybar/audio_switch.sh".source = ./audio_switch.sh;
		".config/waybar/server_temp.sh".source = ./server_temp.sh;
	};

	programs.waybar = {
		enable = true;

		settings = {
			mainBar = {
				"position" = "left";
				"mod" = "dock";
				"width" = 50;
				"output" = selectedOutput;
				"margin-left" = 20;
				"margin-right" = -10;
				"margin-top" = 20;
				"margin-bottom" = 20;
				"reload_style_on_change" = true;
				"modules-left" = [
					"custom/spacer"
					"hyprland/workspaces"
				];
				"modules-center" = [
					"hyprland/window"
				];
				"modules-right" = [
					"custom/server_temp"
					"custom/spacer"
					"custom/audio_switch"
					"group/expand"
					"clock#H"
					"clock#M"
					"clock#S"
					"custom/spacer"
					"custom/spacer"
				];

				# --- Custom Modules ---
				"custom/spacer" = {
					"format" = "|";
					"rotate" = 90;
					"tooltip" = false;
				};

				"bluetooth" = {
					"on-click" = "kitty --class center-float bluetuith";
					"format-on" = "";
					"format-off" = "󰂲";
					"format-disabled" = "󰂲";
					"format-connected" = "";
				};

				"custom/audio_switch" = {
					"exec" = "~/.config/waybar/audio_switch.sh";
					"on-click" = "~/.config/waybar/audio_switch.sh -s";
					"tooltip-format" = "Beep boop audio";
					"restart-interval" = 1;
				};

				"custom/server_temp" = {
					"exec" = "~/.config/waybar/server_temp.sh";
					"tooltip-format" = "Maid0";
					"rotate" = 90;
				};

				"custom/menu" = {
					"format" = "󰅃";
					"rotate" = 0;
				};

				"tray" = {
					"icon-size" = 16;
					"rotate" = 0;
					"spacing" = 3;
				};

				"group/expand" = {
					"orientation" = "vertical";
					"drawer" = {
						"transition-duration" = 600;
						"children-class" = "not-power";
						"transition-to-left" = true;
					};
					"modules" = [
						"custom/menu"
						"tray"
						"bluetooth"
					];
				};

				"hyprland/window" = {
					"format" = "{class}";
					"rotate" = 90;
					"max-length" = 120;
					"icon" = false;
					"icon-size" = 13;
				};

				"hyprland/workspaces" = {
					"format" = "{icon}";
					"format-icons" = {
						"default" = "";
						"active" = "";
						"empty" = "";
					};
					"persistent-workspaces" = persistentForOutput;
				};

				"clock#H" = {
					"format" = "{:%H}";
					"interval" = 1;
					"rotate" = 0;
					"tooltip-format" = "<tt>{calendar}</tt>";
					"calendar" = {
						"mode-mon-col" = 3;
						"on-scroll" = 1;
						"on-click-right" = "mode";
						"format" = {
							"months" = "<span color='#ffead3'><b>{}</b></span>";
							"weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
							"today" = "<span color='#ff6699'><b>{}</b></span>";
						};
					};
					"actions" = {
						"on-click-right" = "mode";
						"on-click-forward" = "tz_up";
						"on-click-backward" = "tz_down";
						"on-scroll-up" = "shift_up";
						"on-scroll-down" = "shift_down";
					};
				};

				"clock#M" = {
					"format" = "{:%M}";
					"interval" = 1;
					"rotate" = 0;
					"tooltip-format" = "<tt>{calendar}</tt>";
					"calendar" = {
						"mode-mon-col" = 3;
						"on-scroll" = 1;
						"on-click-right" = "mode";
						"format" = {
							"months" = "<span color='#ffead3'><b>{}</b></span>";
							"weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
							"today" = "<span color='#ff6699'><b>{}</b></span>";
						};
					};
					"actions" = {
						"on-click-right" = "mode";
						"on-click-forward" = "tz_up";
						"on-click-backward" = "tz_down";
						"on-scroll-up" = "shift_up";
						"on-scroll-down" = "shift_down";
					};
				};

				"clock#S" = {
					"format" = "{:%S}";
					"interval" = 1;
					"rotate" = 0;
					"tooltip-format" = "<tt>{calendar}</tt>";
					"calendar" = {
						"mode-mon-col" = 3;
						"on-scroll" = 1;
						"on-click-right" = "mode";
						"format" = {
							"months" = "<span color='#ffead3'><b>{}</b></span>";
							"weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
							"today" = "<span color='#ff6699'><b>{}</b></span>";
						};
					};
					"actions" = {
						"on-click-right" = "mode";
						"on-click-forward" = "tz_up";
						"on-click-backward" = "tz_down";
						"on-scroll-up" = "shift_up";
						"on-scroll-down" = "shift_down";
					};
				};
			};
		};

		style = ''
			* {
				font-family: "CartographCF Nerd Font";
				font-size: 16px;
				min-height: 0;
				font-weight: bold;
			}

			window#waybar {
				background-color: rgba(57, 53, 82, .9);
				border-radius: 10px;
				color: #e0def4;
			}

			#custom-spacer {
				opacity: 0;
			}

			#workspaces button {
				background: inherit;
				border: none;
				margin-left: -8px;
				margin-bottom: -10px;
				padding: 0px;
				color: #e0def4;
			}

			#workspaces button label {
				font-size: 28px;
			}

			#workspaces button.urgent {
				color: #eb6f92;
			}

			#workspaces button:hover {
				background: inherit;
				box-shadow: none;
				text-shadow: none;
				border: none;
				color: #c4a7e7;
			}

			#custom-server_temp {
				color: #eb6f92;
			}

			#custom-audio_switch {
				color: #3e8fb0;
			}

			#tray {
				background: inherit;
			}

			#clock {
				color: #c4a7e7;
				background: inherit;
				font-weight: 900;
				font-style: italic;
				font-size: 25px;
				margin-bottom: -8px;
			}
		'';
	};
}