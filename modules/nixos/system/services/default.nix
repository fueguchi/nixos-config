{
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    xkb = {
      layout = "br";
      variant = "abnt2";
    };
};
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
    touchpad = {
      accelProfile = "flat";
    };
  };
  services.dbus = {
    enable = true;
    packages = with pkgs; [ dconf];
  };

  services = {
    gvfs.enable = true;
    xserver.displayManager.lightdm.enable = false;
    displayManager.gdm.enable = false;
    gnome.sushi.enable = true;
    blueman.enable = true;
  };
  hardware.bluetooth.enable = true;
}
