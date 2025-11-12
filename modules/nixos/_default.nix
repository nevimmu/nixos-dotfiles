# NixOS default module
{
	imports = [
		./gaming/_default.nix

		./bluetooth.nix
		./clipboard.nix
		./configuration.nix
		./deluge.nix
		./docker.nix
		./environmentVariables.nix
		# ./gnome.nix
		./loginManager.nix
		./nix-your-shell.nix
		./nvidia.nix
		./pipewire.nix
		./sops.nix
		./ssh.nix
		./tailscale.nix
	];
}