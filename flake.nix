{
  description = "my flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    
    hyprland.url = "github:hyprwm/Hyprland";
    
    nix-gaming.url = "github:fufexan/nix-gaming";

    nixvim.url = "github:nix-community/nixvim";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    
    quickshell.url = "github:quickshell-mirror/quickshell";
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
