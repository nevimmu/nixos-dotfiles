{ pkgs, lib, config, ... }: 

{
	options = {
		gimp.enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
			description = "Enable GIMP";
		};
	};

	config = lib.mkIf config.gimp.enable {
		home.packages = [ pkgs.gimp ];
	};
}