{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      #package = pkgs.kdePackages.sddm;
      theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
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
