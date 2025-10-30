# NixOS default module
{
	imports = [
		./configuration.nix
		./bluetooth.nix
		./steam.nix
		./nvidia.nix
		./pipewire.nix
		./loginManager.nix
		./environmentVariables.nix
		./sops.nix
		./ssh.nix
	];
}