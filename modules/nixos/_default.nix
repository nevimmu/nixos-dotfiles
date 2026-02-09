# NixOS default module
{
	imports = [
		./gaming/_default.nix

		./blender.nix
		./bluetooth.nix
		./clipboard.nix
		./configuration.nix
		./deluge.nix
		./docker.nix
		./environmentVariables.nix
		./ffmpeg.nix
		./freecad.nix
		# ./gnome.nix
		./loginManager.nix
		./nix-your-shell.nix
		./nvidia.nix
		./pipewire.nix
		./sops.nix
		./ssh.nix
		./stylix.nix
		./tailscale.nix
	];
}