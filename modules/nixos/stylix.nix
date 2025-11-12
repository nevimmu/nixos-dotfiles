{ pkgs, inputs, ... }:

{
	stylix = {
		enable = true;
		
		# Use rose-pine color scheme
		base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
		
		# Cursor configuration
		cursor = {
			package = pkgs.rose-pine-cursor;
			name = "BreezeX-RosePine-Linux";
			size = 28;
		};
		
		# Font configuration
		fonts = {
			monospace = {
				package = inputs.cartographcf-nf.packages.${pkgs.system}.cartographcf-nf;
				name = "CartographCF Nerd Font";
			};

			sansSerif = {
				package = pkgs.noto-fonts;
				name = "Noto Sans";
			};

			serif = {
				package = pkgs.noto-fonts;
				name = "Noto Serif";
			};

			sizes = {
				applications = 11;
				terminal = 15;
				desktop = 10;
				popups = 10;
			};
		};

		# Opacity settings
		opacity = {
			applications = 1.0;
			terminal = 0.95;
			desktop = 1.0;
			popups = 1.0;
		};

		# Polish settings
		polarity = "dark"; # or "light" for rose-pine-dawn
	};
}