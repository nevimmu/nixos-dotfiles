# NixOS default module
{
	imports = [
		./configuration.nix
		./bluetooth.nix
		./steam.nix
		./nvidia.nix
		./pipewire.nix
		./loginManager.nix
	];
}