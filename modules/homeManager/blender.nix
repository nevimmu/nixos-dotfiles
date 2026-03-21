{ lib, config, pkgs, ... }:

{
	options = {
		blender.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable Blender";
		};
	};

	config = lib.mkIf config.blender.enable {
		home.packages = [
			(pkgs.blender.override {
				cudaSupport = true;
			})
		];
	};
}