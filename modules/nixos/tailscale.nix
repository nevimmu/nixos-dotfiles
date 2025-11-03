{
	services.tailscale = {
		enable = true;

		extraSetFlags = [
			"--operator=nev"
		];
	};
}