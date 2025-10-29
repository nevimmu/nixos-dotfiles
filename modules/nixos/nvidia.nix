{ pkgs, lib, config, ... }:

{
	options = {
		nvidia.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable NVIDIA drivers";
		};
	};

	config = lib.mkIf config.nvidia.enable {
		hardware.nvidia = {
			modesetting.enable = true;
			open = false;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.latest;
		};

		services.xserver.videoDrivers = ["nvidia"];
	};
}