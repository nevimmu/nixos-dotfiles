{
	services.dunst = {
		enable = true;

		settings = {
			global = {
				width = "(80, 600)";
				offset = "(10, 10)";
				progress_bar_min_width = 380;
				progress_bar_max_width = 380;
				progress_bar_corner_radius = 2;

				padding = 10;
				horizontal_padding = 10;
				corner_radius = 10;
				frame_width = 2;
				gap_size = 3;
				font = "CartographCF Nerd Font 16";

				background = "#393552";
				foreground = "#e0def4";
			};

			urgency_low = {
				background = "#232136f2";
				highlight = "#3e8fb0";
				frame_color = "#3e8fb0";
				default_icon = "dialog-information";
				format = "<b><span foreground='#3e8fb0'>%s</span></b>\n%b";
			};

			urgency_normal = {
				background = "#232136f2";
				highlight = "#c4a7e7";
				frame_color = "#c4a7e7";
				default_icon = "dialog-warning";
				format = "<b><span foreground='#c4a7e7'>%s</span></b>\n%b";
			};

			urgency_critical = {
				background = "#232136f2";
				highlight = "#eb6f92";
				frame_color = "#eb6f92";
				default_icon = "dialog-error";
				format = "<b><span foreground='#eb6f92'>%s</span></b>\n%b";
			};

			screenshots = {
				appname = "Hyprshot";
				max_icon_size = 256;
				frame_color = "#FF0000";
			};
		};
	};
}