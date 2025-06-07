{ pkgs }:
{
  services.swayosd.enable = true;
  services.swayosd.package = pkgs.swayosd;
  services.swayosd.stylePath = "themes/theme-1/style.css";
}
