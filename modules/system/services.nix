{
  services = {
    xserver.enable = true;
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
    gnome.sushi.enable = true;
    xserver.displayManager.lightdm.enable = false;
    xserver.displayManager.gdm.enable = false;
  };
}
