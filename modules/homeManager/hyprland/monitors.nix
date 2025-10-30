{
	monitor = [
		"DP-1, 2560x1440@169.83, 0x0, 1"
		"HDMI-A-1, 1920x1080@60.00, 2560x-240, 1, transform, 3"
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
}
