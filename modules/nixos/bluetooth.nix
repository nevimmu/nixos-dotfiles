{ config, lib, pkgs, ... }:

{
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};

	hardware.bluetooth.settings = {
		General = {
			Experimental = true;
			DisablePlugins = "audio";
		};
		LE = {
			ConnectionLatency = 0;
		};
	};

	services.blueman.enable = false;

	services.udev.extraRules = ''
		SUBSYSTEM=="bluetooth", ATTR{power/control}="on"
		SUBSYSTEM=="hidraw", ATTR{power/control}="on"
	'';

	boot.kernelParams = [
		"bluetooth.disable_ertm=1"
		"usbcore.autosuspend=-1"
	];


	environment.systemPackages = with pkgs; [
		bluetuith
		adw-bluetooth
	];
}