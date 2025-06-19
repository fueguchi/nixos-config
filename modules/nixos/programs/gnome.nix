{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zenity
    file-roller
    nautilus
    gnome-font-viewer
  ];

  services.gnome.sushi.enable = true;
}
