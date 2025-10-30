{ pkgs, config, ... }:

{
	programs.ssh = {
		# enable = true;
		extraConfig = ''
			Include ${config.sops.secrets."ssh/config".path}
		'';
	};
}