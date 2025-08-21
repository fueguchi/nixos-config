{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./configs/animations
    ./configs/default
    ./hypridle
    #./hyprlock
    ./hyprportal
    ./swayosd
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    #systemd.variables = [ "--all" ];
  };

  home.packages = with pkgs; [
    hyprshot
    hyprcursor
    hyprwayland-scanner
    hyprland-protocols
    grim
    wl-clipboard
    slurp
    swww
  ];
}
