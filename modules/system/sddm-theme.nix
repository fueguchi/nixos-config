{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "025705b3296d478e74d1041e4495e7a4ae466f92";
    sha256 = "sha256-RIVvgPeRYZhnwSKqocZ0b8BgA5a1YVU8IZD81Hc8t5s=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
