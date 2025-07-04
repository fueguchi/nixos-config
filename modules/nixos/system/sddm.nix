{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    #theme = "where-is-my-sddm-theme";
    #extraPackages = [ (pkgs.callPackage ./sddm-theme.nix {}) ];
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
}
