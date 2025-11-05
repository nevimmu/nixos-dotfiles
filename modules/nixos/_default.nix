# NixOS default module
{
	imports = [
		./bluetooth.nix
		./clipboard.nix
		./configuration.nix
		./docker.nix
		./environmentVariables.nix
		./gnome.nix
		./loginManager.nix
		./nvidia.nix
		./pipewire.nix
		./sops.nix
		./ssh.nix
		./steam.nix
		./tailscale.nix
	];
}