{
  description = "my flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, spicetify-nix, nixvim, ... } @ inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = import nixpkgs-unstable { system = "x86_64-linux"; config.allowUnfree = true; }; 
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
        inherit pkgs-unstable;
      };
      modules = [
        ./host/wired/configuration.nix
        nixvim.nixosModules.nixvim
        spicetify-nix.nixosModules.spicetify
        home-manager.nixosModules.default
      	{
          home-manager = {
            users.erik = {
              imports = [ ./home/home.nix ];
            };
          };
        }
      ];
    };
    homeConfigurations."erik@wired" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ 
      ./home/home.nix
      ];
    };
  };
}
