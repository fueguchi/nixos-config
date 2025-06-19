{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #lang
    nodejs_24
    python312Full
    libgcc
    gcc_debug
    go
    
    # \o/
    ccls
    cmake
    gnumake
    nixd
    nil

  ];
  programs.nix-ld.enable = true;
}
