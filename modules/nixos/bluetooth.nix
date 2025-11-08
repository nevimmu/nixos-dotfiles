{ config, lib, pkgs, ... }:

{
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;

		settings = {
			General = {
				Experimental = true;
				FastConnectable = true;
				ControllerMode = "bredr";
			};
			Policy = {
				AutoEnable = true;
			};
		};
	};

	services.blueman.enable = true;
	services.dbus.packages = [ pkgs.blueman ];

	environment.systemPackages = with pkgs; [
		bluetuith
	];
}