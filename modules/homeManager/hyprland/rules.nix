{
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

		# Affinity
		"tile, title:Affinity"

		# Deluge
		"workspace 6, class:deluge"
		"float, title:^Add Torrents.*$"
		"center, title:^Add Torrents.*$"

		# Transparency on some programs
		"opacity 0.95, class:^(Code|Spotify|discord|org.gnome.Nautilus)$"

		# Minecraft
		# "fullscreen, class:^(Minecraft\* [0-9]+\.[0-9]+\.[0-9]+)$"
		"float, title:^Console window for .*$"
		"size 500 700, title:^Console window for .*$"
		"center, title:^Console window for .*$"
	];

	layerrule = [
		# Add blur to rofi
		"blur, rofi"
		"ignorealpha, rofi"

		"blur, waybar"
	];
}
