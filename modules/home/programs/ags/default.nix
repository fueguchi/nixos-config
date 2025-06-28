{ inputs, config, lib, pkgs-unstable, system, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    extraPackages = with pkgs-unstable; [
      inputs.ags.packages.${system}.battery
      fzf
    ];
  };
}
