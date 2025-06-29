{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "sddm-theme-where-is-my-sddm-theme";
  version = "v1.12.0";

  src = pkgs.fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "e12d4c3fe074ecef650b139c2626785d967bd11";
    sha256 = "sha256-D2ojqA8odNWVcPqNuHcmH6HojsmhJtiZyAS3Xp/6jHg=";
  };
  installPhase = ''
    mkdir -p $out/share/sddm/themes/where_is_my_sddm_theme
    cp -R $src/where_is_my_sddm_theme/* $out/share/sddm/themes/where_is_my_sddm_theme/
  '';
}
