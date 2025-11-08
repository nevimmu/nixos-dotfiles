{ pkgs, lib, config, ... }:

{
	options = {
		prismLauncher.enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable Prism Launcher";
		};
	};

	config = lib.mkIf config.prismLauncher.enable {
		environment.systemPackages = with pkgs; [
			(prismlauncher.override {
				# Add binary required by some mod
				additionalPrograms = [ ffmpeg ];
			})
		];
	};
}