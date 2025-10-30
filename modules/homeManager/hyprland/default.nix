{ pkgs, lib, config, ... }: 

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

			"$terminal" = "kitty";
			"$fileManager" = "nautilus";
			"$menu" = "rofi -show drun";

			monitor = [
				"DP-1, 2560x1440@169.83, 0x0, 1"
				"HDMI-A-1, 1920x1080@60.00, 2560x-240, 1, transform, 3"
			];

			exec-once = [
				"waybar"
				# "hyprsunset"
				# "hypridle"
				# "hyprfloat"
				# "hyprdvd"
				"swww-daemon"
				# "jams"
				# "systemctl --user start hyprpolkitagent"

				"[workspace 10 silent] spotify"
				"[workspace 10 silent] discord"
				"[workspace 1 silent] zen-twilight"
			];


			general = {
				"gaps_in" = 5;
				"gaps_out" = 20;
				"border_size" = 2;
				"col.active_border" = "0xffc4a7e7";
				"col.inactive_border" = "0xff6e6a86";
				"resize_on_border" = false;
				"allow_tearing" = false;
				"layout" = "dwindle";
			};

			decoration = {
				"rounding" = 10;
				"rounding_power" = 2;
				"dim_special" = 0.5;

				"active_opacity" = 1.0;
				"inactive_opacity" = 1.0;

				shadow = {
					"enabled" = false;
					"range" = 4;
					"render_power" = 3;
					"color" = "rgba(1a1a1aee)";
				};

				blur = {
					"enabled" = true;
					"size" = 4;
					"passes" = 2;

					"vibrancy" = 0.1696;
				};
			};

			animations = {
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
					"custom, 0.05, 0.8, 0.1, 1.05"
				];

				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.30, almostLinear, slidevert"
					"workspacesIn, 1, 1.30, almostLinear, slidevert"
					"workspacesOut, 1, 1.30, almostLinear, slidevert"
					"specialWorkspace, 1, 1.30, almostLinear, fade"
				];
			};

			dwindle = {
				"pseudotile" = true;
				"preserve_split" = true;
				"force_split" = 2;
			};

			misc = {
				"force_default_wallpaper" = -1;
				"disable_hyprland_logo" = true;

				"enable_swallow" = true;
				"swallow_regex" = "^kitty$";
			};

			input = {
				"kb_layout" = "fr";
				"kb_options" = "caps:swapescape";
				"numlock_by_default" = true;

				"follow_mouse" = 1;

				"repeat_delay" = 170;
				"repeat_rate" = 70;
			};

			bind = [
				"SUPER, return, exec, $terminal"
				"SUPER, Q, killactive,"
				"SUPER SHIFT, M, exit,"
				"SUPER, E, exec, $fileManager"
				"SUPER, T, exec, $terminal -e btop"
				"SUPER, D, exec, $terminal -e lazydocker"
				"SUPER, Y, exec, $terminal -e yazi"
				"SUPER, P, exec, $menu"
				"SUPER, W, exec, pkill waybar && waybar"
				"SUPER, U, togglesplit," # dwindle
				"SUPER, G, exec, kitty --title DVD"

				# Minimize
				"SUPER, S, togglespecialworkspace, magic"
				"SUPER, S, movetoworkspace, +0"
				"SUPER, S, togglespecialworkspace, magic"
				"SUPER, S, movetoworkspace, special:magic"
				"SUPER, S, togglespecialworkspace, magic"

				# Screenshot
				"SUPER SHIFT, S, exec, hyprshot -m region"
				", print, exec, hyprshot -m output"

				# Power
				"SUPER, escape, exec, wlogout"

				# Wallpaper
				"SUPER, SPACE, exec, wallpaper-maid"

				# Projects
				"SUPER, I, exec, ~/.config/hypr/scripts/projects"

				# Control window
				"SUPER, F, toggleFloating,"
				"SUPER SHIFT, F, fullscreen,"

				"SUPER SHIFT, h, movewindow, l"
				"SUPER SHIFT, j, movewindow, d"
				"SUPER SHIFT, k, movewindow, u"
				"SUPER SHIFT, l, movewindow, r"

				# Move focus with mod + VIM keys
				"SUPER, h, movefocus, l"
				"SUPER, j, movefocus, d"
				"SUPER, k, movefocus, u"
				"SUPER, l, movefocus, r"


				# Resize window
				"SUPER CTRL, h, resizeactive, -50 0"
				"SUPER CTRL, j, resizeactive, 0 50"
				"SUPER CTRL, k, resizeactive, 0 -50"
				"SUPER CTRL, l, resizeactive, 50 0"

				# Switch to previous workspace
				"SUPER, TAB, workspace, previous"

				# Switch workspaces with mod + [0-9]
				"SUPER, ampersand  , workspace, 1"
				"SUPER, eacute     , workspace, 2"
				"SUPER, quotedbl   , workspace, 3"
				"SUPER, apostrophe , workspace, 4"
				"SUPER, parenleft  , workspace, 5"
				"SUPER, minus      , workspace, 6"
				"SUPER, egrave     , workspace, 7"
				"SUPER, underscore , workspace, 8"
				"SUPER, ccedilla   , workspace, 9"
				"SUPER, agrave     , workspace, 10"

				# Move active window to a workspace with mod + SHIFT + [0-9]
				"SUPER SHIFT, ampersand  , movetoworkspace, 1"
				"SUPER SHIFT, eacute     , movetoworkspace, 2"
				"SUPER SHIFT, quotedbl   , movetoworkspace, 3"
				"SUPER SHIFT, apostrophe , movetoworkspace, 4"
				"SUPER SHIFT, parenleft  , movetoworkspace, 5"
				"SUPER SHIFT, minus      , movetoworkspace, 6"
				"SUPER SHIFT, egrave     , movetoworkspace, 7"
				"SUPER SHIFT, underscore , movetoworkspace, 8"
				"SUPER SHIFT, ccedilla   , movetoworkspace, 9"
				"SUPER SHIFT, agrave     , movetoworkspace, 10"

				# Scratchpad
				"SUPER, N, togglespecialworkspace, scratchpad"
				"SUPER SHIFT, N, movetoworkspace, special:scratchpad"

				# OBS
				"SUPER, O, togglespecialworkspace, obs"
				"SUPER SHIFT, O, movetoworkspace, special:obs"
				"SUPER, F1, pass, class:^(com\.obsproject\.Studio)$"
				"SUPER, F2, pass, class:^(com\.obsproject\.Studio)$"
				"SUPER, F10, pass, class:^(com\.obsproject\.Studio)$"
				"SUPER, F11, pass, class:^(com\.obsproject\.Studio)$"
			];

			bindm = [
				"SUPER, mouse:272, movewindow"
				"SUPER, mouse:273, resizewindow"
			];

			bindl = [
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPause, exec, playerctl play-pause"
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioPrev, exec, playerctl previous"
			];

			workspace = [
				"1, monitor:DP-1, default:true"
				"1, monitor:DP-1"
				"2, monitor:DP-1"
				"3, monitor:DP-1"
				"4, monitor:DP-1"
				"5, monitor:DP-1"
				"6, monitor:DP-1"
				"7, monitor:DP-1"
				"8, monitor:HDMI-A-1"
				"9, monitor:HDMI-A-1"
				"10, monitor:HDMI-A-1, default:true"

				"special:scratchpad, on-created-empty:kitty"
				"special:obs, on-created-empty:obs"
			];

			windowrule = [
				# Ignore maximize requests from apps. You'll probably like this.
				"suppressevent maximize, class:.*"

				# Steam & Heroic Games Launcher on workspace 5
				"workspace 5 silent, center 1, title:^(Steam|Sign in to Steam|Heroic Games Launcher)$"

				# Discord and Spotify on workspace 10
				"workspace 10 silent, class:^(discord|Spotify)$"

				# Float and center client with the class "center-float"
				"float, class:^(center-float)$"
				"center, class:^(center-float)$"
				"size 900 700, class:^(center-float)$"

				# Fix some dragging issues with XWayland
				"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			];

			windowrulev2 = [
				# PIP
				"float, title:Picture-in-Picture"
				"workspace 10, title:Picture-in-Picture"
				"size 1036 931, title:Picture-in-Picture"
				"move 22 22, title:Picture-in-Picture"

				# Transparency on some programs
				"opacity 0.95, class:^(Code|Spotify|discord|org.gnome.Nautilus)$"
			];

			layerrule = [
				# Add blur to rofi
				"blur, rofi"
				"ignorealpha, rofi"

				"blur, waybar"
			];

		};
	};
}