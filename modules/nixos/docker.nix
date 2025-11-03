{ pkgs, lib, config, ... }:

{
	options = {
		docker.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable Docker";
		};
	};

	config = lib.mkIf config.docker.enable {
		virtualisation.docker = {
			enable = true;
			storageDriver = "btrfs";
		};

		users.users.nev.extraGroups = [ "docker" ];

		environment.systemPackages = with pkgs; [
			docker-compose
			docker-buildx
			lazydocker
		];
	};
}