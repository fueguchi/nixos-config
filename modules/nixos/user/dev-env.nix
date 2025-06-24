{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #lang
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

    # health care ngl :D
    git-credential-manager
    
    # just for discord badge
    nodejs_24

    # typescript for ags :)
    typescript
    typescript-language-server
  ];
  programs.nix-ld.enable = true;
}
