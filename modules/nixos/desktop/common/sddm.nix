{
  pkgs,
  ...
}: let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "cyberpunk";
  };
  
  weston-ini = pkgs.writeText "weston.ini" ''
    [keyboard]
    keymap_layout=br
    keymap_model=pc104
    keymap_options=terminate:ctrl_alt_bksp
    keymap_variant=abnt2

    [libinput]
    enable-tap=true
    left-handed=false

    [output]
    name=HDMI-A-1
    mode=1920x1080

    [output]
    name=eDP-1
    mode=off
  '';
in {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland = {
      enable = true;
      compositor = "weston";
    };
    enableHidpi = true;
    theme = "sddm-astronaut-theme";
    settings.Theme = {
      Current = "sddm-astronaut-theme";
      CursorTheme = "capitaine-cursors";
      CursorSize = 28;
    };
    settings.Wayland.CompositorCommand = "${pkgs.weston}/bin/weston --shell=kiosk -c ${weston-ini}";
    extraPackages = with pkgs; [
      custom-sddm-astronaut
    ];
  };
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor manager by UWSM";
        binPath = "/home/erik/.nix-profile/bin/Hyprland";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    sddm-themes.where-is-my-sddm-theme
    weston
    custom-sddm-astronaut
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5ct
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols
    kdePackages.qtmultimedia
  ];
}
