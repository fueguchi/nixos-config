{
  description = "my flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs-unstable";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs-unstable"; 

    ags.url = "github:aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs-unstable";

    astal.url = "github:aylur/astal";
    astal.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, spicetify-nix, nixvim, astal, ags, ... } @ inputs:
    let 
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable { 
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
        inherit pkgs-unstable;
      };
      modules = [
        ./host/wired/configuration.nix
      ];
    };

    homeConfigurations."erik@wired" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = { 
        inherit pkgs-unstable;
        inherit inputs;
        inherit system;
        };
      modules = [
        ./home/home.nix
        nixvim.homeModules.nixvim
        spicetify-nix.homeManagerModules.spicetify
      ];
    };

    packages.${system}.agsApp = pkgs.stdenvNoCC.mkDerivation rec {
      name = "my-ags-config";
      src = ./home/programs/ags/config;

      nativeBuildInputs = [
        pkgs.esbuild
        pkgs.wrapGAppsHook
        pkgs.gobject-instrospection
      ];

      buildInputs = [
        pkgs.gjs
        pkgs.glib
        pkgs.gtk4
        astal.packages.${system}.io
        astal.packages.${system}.astal4
      ];

      installPhase = ''
        mkdir -p $out/bin
       
        esbuild \
          --bundle src/app.js \
          --outfile=$out/bin/my-shell \
          --format=esm \
          --sourcemap=inline \
          --ternal:gi//\*
      '';
    };
  };
}
