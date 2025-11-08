{ pkgs, lib, config, ... }:

{
	options = {
		heroic.enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable Heroic Games Launcher";
		};
	};

	config = lib.mkIf config.heroic.enable {
		environment.systemPackages = with pkgs; [
			(heroic.override {
				extraPkgs = pkgs: [
					pkgs.gamescope
				];
			})
		];
	};
}