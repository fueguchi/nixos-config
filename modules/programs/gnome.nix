{ pkgs, ... }:
{
  environment.systemPackages = [
    zenity
    file-roller
    nautilus
    gnome-font-viewer
  ];

  services.gnome.sushi.enable = true;
}
