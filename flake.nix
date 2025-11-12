{
  description = "Hyprland on Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nvf.url = "github:notashelf/nvf";

    cartographcf-nf.url = "git+ssh://git@github.com/nevimmu/CartographCFNerdFont.git";

    jams = {
      url = "github:nevimmu/JAMS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpaper-maid = {
      url = "github:nevimmu/wallpaper-maid";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprfloat = {
      url = "github:nevimmu/hyprfloat";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprdvd = {
      url = "github:nevimmu/hyprdvd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprshot = {
      url = "github:nevimmu/Hyprshot";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    affinity-nix = {
      url = "github:mrshmllow/affinity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.BunnyGirl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/desktop/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.disko
        inputs.sops-nix.nixosModules.sops
        inputs.stylix.nixosModules.stylix
      ];
    };

    nixosConfigurations.OfficeLady = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/thinkpad/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.disko
        inputs.sops-nix.nixosModules.sops
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}

