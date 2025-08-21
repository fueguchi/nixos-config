{ 
  pkgs, 
  ... 
}: {
  
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      warn-dirty = true;
    };

    gc.automatic = true;
    gc.dates = "weekly";
    gc.options = "--delete-older-than 7d";
  };
  
  environment.systemPackages = with pkgs; [ 
    nix-prefetch
    nix-prefetch-github
    nix-index
  ];
}