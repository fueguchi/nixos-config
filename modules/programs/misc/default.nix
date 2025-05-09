{ pkgs, ... }:
{
  imports = [ ./eww.nix ];
  programs = {
    noisetorch.enable = true;
  };
  environment.systemPackages = with pkgs; [
    rofi
    swww
    pywal16
  ];
}
