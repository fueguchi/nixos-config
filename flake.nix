{
  outputs = {
    self,
    ...
  } @ inputs:
  let
    inherit (self) outputs;

    system = "x86_64-linux";
    lib = inputs.nixpkgs.lib;

    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        (import ./overlays {inherit inputs outputs;})
      ];
      config.allowUnfree = true;
      config.chromium.enableWideVine = true;
    };

    mkNixosConfig = { hostName, extraModules, system }:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          (./. + "/nixos/${hostName}/configuration.nix")
        ] ++ extraModules;
      };

    mkHMConfig = { homeName, extraModules, system, homeDirectory }:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit system;
          hostVars = {
            inherit homeDirectory;
          };
        };
        modules = [
          (./. + "/home/${homeName}/home.nix")
        ] ++ extraModules;
      };
  in {
    nixosConfigurations = {
      wired = mkNixosConfig {
        hostName = "wired";
        system = "x86_64-linux";
        extraModules = [
          inputs.nix-gaming.nixosModules.platformOptimizations
          inputs.nix-gaming.nixosModules.pipewireLowLatency
        ];
      };
    };

    homeConfigurations = {
      "erik@wired" = mkHMConfig {
      homeName ="erik@wired";
      system = "x86_64-linux";
      homeDirectory = "/home/erik";
      extraModules = [
          inputs.nixvim.homeModules.nixvim
          inputs.spicetify-nix.homeManagerModules.spicetify
          inputs.hyprland.homeManagerModules.default
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
