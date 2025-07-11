{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      xkb = {
        layout = "br";
        variant = "abnt2";
      };
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
      touchpad = {
        accelProfile = "flat";
      };
    };
    dbus = {
      enable = true;
      packages = with pkgs; [ dconf];
    };
    gvfs.enable = true;
    xserver.displayManager.lightdm.enable = false;
    xserver.displayManager.gdm.enable = false;
    gnome.sushi.enable = true;
    blueman.enable = true;
    zerotierone.enable = true;
  };
}
