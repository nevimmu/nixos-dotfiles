{
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
}
