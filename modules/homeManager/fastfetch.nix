{
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				type = "small";
				padding.top = 2;
				color = {
					"1" = "blue";
					"2" = "magenta";
				};
			};

			display = {
				color = {
					keys = "magenta";
					title = "blue";
				};
			};

			modules = [
				"title"
				"separator"
				{
					"type" = "os";
					"format" = "{name}";
				}
				"kernel"
				{
					"type" = "packages";
					"format" = "{nix-all}";
				}
				{
					"type" = "wm";
					"format" = "{pretty-name}";
				}
				{
					"type" = "terminal";
					"format" = "{pretty-name}";
				}
				{
					"type" = "terminalfont";
					"format" = "CartographCF Nerd Font";
				}
				{
					"type" = "shell";
					"format" = "{pretty-name}";
				}
				"theme"
				"uptime"
			];
		};
	};
}