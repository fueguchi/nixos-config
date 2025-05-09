{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
    uwsm
  ];
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "where-is-my-sddm-theme";
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
