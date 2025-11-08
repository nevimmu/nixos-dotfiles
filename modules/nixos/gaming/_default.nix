{
	imports = [
		./heroic.nix
		./steam.nix
		./prismLauncher.nix
	];

	programs.gamescope.enable = true;
	programs.gamemode.enable = true;
}