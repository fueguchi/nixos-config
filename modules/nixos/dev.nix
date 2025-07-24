{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    
    vscode
    gcc
    python312Full
    typescript
    nodejs_24
    jdk24

  ];
}
