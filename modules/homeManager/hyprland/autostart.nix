{
	exec-once = [
		"waybar"
		"swww-daemon"
		"systemctl --user start hypridle.service"
		# "systemctl --user start hyprpolkitagent"
		"lxqt-policykit-agent"

		# Clipboard persistence
		"wl-clip-persist --clipboard both"
		"wl-paste --type text --watch cliphist store"
		"wl-paste --type image --watch cliphist store"

		"[workspace 10 silent] spotify"
		"[workspace 10 silent] discord"
		"[workspace 1 silent] zen-twilight"
	];
}
