{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "br";
        variant = "abnt2";
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
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
    dbus = { packages = with pkgs; [ dconf]; };
    gvfs.enable = true;
    gnome.sushi.enable = true;
    xserver.displayManager.lightdm.enable = false;
    xserver.displayManager.gdm.enable = false;
  };
}
