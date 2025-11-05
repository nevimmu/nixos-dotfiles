{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		wl-clipboard
		wl-clip-persist
		cliphist
	];
}