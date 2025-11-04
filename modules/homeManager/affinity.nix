{ inputs, lib, config, ... }:

{
	options = {
		affinity.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable Affinity";
		};
	};

	config = lib.mkIf config.affinity.enable {
		home.packages = [
			inputs.affinity-nix.packages.x86_64-linux.v3
		];
	};

}