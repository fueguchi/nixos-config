{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pywal16
    eza
    duf
  ];
}
