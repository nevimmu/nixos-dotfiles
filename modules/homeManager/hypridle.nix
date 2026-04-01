{
	services.hypridle = {
		enable = true;

		settings = {
			general = {
				lock_cmd = "pidof hyprlock || hyprlock";
				before_sleep_cmd = "loginctl lock-session";
				after_sleep_cmd = "hyprctl dispatch dpms";
			};

			listener = [
				{
					timeout = 900; # 15 minutes
					on-timeout = "hyprdvd -s";
				}
				{
					timeout = 1200; # 25 minutes
					on-timeout = "hyprctl dispatch dpms off";
					on-resume = "hyprctl dispatch dpms on";
				}
				{
					timeout = 1500; # 20 minutes
					on-timeout = "loginctl lock-session && pkill waybar && waybar";
				}
				# {
				# 	timeout = 2100; # 35 minutes
				# 	on-timeout = "systemctl suspend";
				# }
			];
		};
	};
}