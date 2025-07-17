{
  description = "my flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    hyprland.url = "github:hyprwm/Hyprland";
    
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs"; 
    
    quickshell.url = "github:quickshell-mirror/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, spicetify-nix, nixvim, ... } @ inputs:
    let 
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      }; 
      username = "erik";
      name = "erik";
    in
  {

    nixosConfigurations.wired = lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit username;
        inherit name;
      };
      modules = [
        ./host/wired/configuration.nix
      ];
    };

    homeConfigurations."erik@wired" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs; 
      extraSpecialArgs = { 
        inherit inputs;
        inherit system;
        };
      modules = [
        ./home/home.nix
        nixvim.homeModules.nixvim
        spicetify-nix.homeManagerModules.spicetify
      ];
    };
  };
}
