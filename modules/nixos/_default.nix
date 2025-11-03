# NixOS default module
{
	imports = [
		./bluetooth.nix
		./configuration.nix
		./docker.nix
		./environmentVariables.nix
		./loginManager.nix
		./nvidia.nix
		./pipewire.nix
		./sops.nix
		./ssh.nix
		./steam.nix
		./tailscale.nix
	];
}