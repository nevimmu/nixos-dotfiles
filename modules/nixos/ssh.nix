{ pkgs, config, lib, ... }:

{
	programs.ssh = lib.mkIf (config.sops.secrets ? "ssh/config") {
		# enable = true;
		extraConfig = ''
			Include ${config.sops.secrets."ssh/config".path}
		'';
	};
}