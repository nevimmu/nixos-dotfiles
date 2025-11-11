{ pkgs, lib, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    
    # Validate secrets only after installation is complete
    validateSopsFiles = lib.mkDefault false;

    secrets = lib.mkIf (builtins.pathExists "/var/lib/sops-nix/key.txt") {
      "ssh/config" = {
        owner = "nev";
        mode = "0600";
      };
      "ssh/github" = {
        owner = "nev";
        mode = "0600";
      };
      "ssh/maid0" = {
        owner = "nev";
        mode = "0600";
      };
      "ssh/aur" = {
        owner = "nev";
        mode = "0600";
      };
    };
  };

	environment.systemPackages = with pkgs; [
		sops
	];
}