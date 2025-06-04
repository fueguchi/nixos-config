{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pywal16
    btop
    eza
  ];
}
