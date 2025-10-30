{
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
}
