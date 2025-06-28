{ pkgs, ... }:
{
  services.swayosd.enable = true;
  services.swayosd.package = pkgs.swayosd;
  services.swayosd.stylePath = "/home/erik/.dotfiles/home/programs/swayosd/themes/theme-1/style.css";
}
