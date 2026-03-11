{
	windowrule = [
		# Ignore maximize requests from apps. You'll probably like this.
		"suppress_event maximize on, match:class .*"

		# Steam & Heroic Games Launcher on workspace 5
		"workspace 5 silent, match:title ^(Steam|Sign in to Steam|Heroic Games Launcher)$"
		"center on, match:title ^(Steam|Sign in to Steam|Heroic Games Launcher)$"

		# Discord and Spotify on workspace 10
		"workspace 10 silent, match:class ^(discord|Spotify)$"

		# Float and center client with the class "center-float"
		"float on, match:class ^(center-float)$"
		"center on, match:class ^(center-float)$"
		"size 900 700, match:class ^(center-float)$"

		# Fix some dragging issues with XWayland
		"no_focus on, match:class ^$, match:title ^$, match:xwayland true, match:float true, match:fullscreen false, match:pin false"

		# PIP
		"float on, match:title Picture-in-Picture"
		"workspace 10, match:title Picture-in-Picture"
		"size 1056 944, match:title Picture-in-Picture"
		"move 12 12, match:title Picture-in-Picture"

		# Affinity
		"tile on, match:title Affinity"

		# Deluge
		"workspace 6, match:class deluge"
		"float on, match:title ^Add Torrents.*$"
		"center on, match:title ^Add Torrents.*$"

		# Transparency on some programs
		"opacity 0.95, match:class ^(Code|Spotify|discord|org.gnome.Nautilus)$"

		# Minecraft
		# "fullscreen on, match:class ^(Minecraft\\* [0-9]+\\.[0-9]+\\.[0-9]+)$"
		"float on, match:title ^Console window for .*$"
		"size 500 700, match:title ^Console window for .*$"
		"center on, match:title ^Console window for .*$"
	];

	layerrule = [
		# Add blur to rofi
		"blur on, match:namespace rofi"
		"ignore_alpha on, match:namespace rofi"

		# Add blur to waybar
		"blur on, match:namespace waybar"
	];
}
