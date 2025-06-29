{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    
    gcc
    python312Full
    typescript
    nodejs_24

  ];
}
