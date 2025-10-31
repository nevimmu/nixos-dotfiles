{ config, ... }:

let
	inherit (config.lib.formats.rasi) mkLiteral;
in
{
	programs.rofi = {
		enable = true;

		font = "Cartograph CF Nerd Font 15";

		extraConfig = {
			modi = "drun,run";
			show-icons = true;
			display-drun = "";
			drun-display-format = "{name}";
		};

		theme = {
			"*" = {
				foreground = mkLiteral "#e0def4";
				background-color = mkLiteral "transparent";
				background = mkLiteral "#232136de";
			};

			"window" = {
				location = mkLiteral "center";
				anchor = mkLiteral "center";
				width = mkLiteral "500px";
				height = mkLiteral "500px";
				margin = mkLiteral "0px";
				padding = mkLiteral "10px";
				border = mkLiteral "2px solid";
				border-color = mkLiteral "#c4a7e7";
				border-radius = mkLiteral "10px";
				background-color = mkLiteral "#232136de";
			};

			"textbox" = {
				text-color = mkLiteral "#e0def4";
			};

			"element-text" = {
				vertical-align = mkLiteral "0.5";
				text-color = mkLiteral "#e0def4";
			};

			"inputbar" = {
				spacing = mkLiteral "10px";
				padding = mkLiteral "10px";
				margin = mkLiteral "0px";
			};

			"textbox-prompt-colon" = {
				enabled = mkLiteral "false";
			};

			"entry" = {
				enabled = mkLiteral "true";
				placeholder = "Search...";
				text-color = mkLiteral "#e0def4";
			};

			"element" = {
				spacing = mkLiteral "10px";
			};

			"listview" = {
				scrollbar = mkLiteral "false";
			};

			"element normal.normal, element alternate.normal" = {
				background-color = mkLiteral "transparent";
			};

			"element selected.normal" = {
				background-color = mkLiteral "#2a283ede";
			};

			"element-icon" = {
				size = mkLiteral "50px";
				background-color = mkLiteral "transparent";
			};
		};
	};
}