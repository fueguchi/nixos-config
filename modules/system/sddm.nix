{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme 
  ];
  services = {
    displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "where-is-my-sddm-theme";
    };
  };
  programs.uwsm.enable = true;
  programs.uwsm.waylandCompositors = {
    hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor manager by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };
}
