{ pkgs, ... }:
  let 
    whereIsMySddmTheme = pkgs.stdenv.mkDerivation {
      pname = "sddm-theme-where-is-my-sddm-theme";
      
      src = pkgs.fetchFromGitHub {
        owner = "stepanzubkov";
        repo = "where-is-my-sddm-theme";
        rev = "e12d4c3fe074ecef650b139c2626785d967bd11";
        sha256 = "sha256-D2ojqA8odNWVcPqNuHcmH6HojsmhJtiZyAS3Xp/6jHg=";
        fetchSubmodules = false;
      };
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -R $src $out/share/sddm/themes/where_is_my_sddm_theme
    '';
 };
in {
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "whereIsMySddmTheme";
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
