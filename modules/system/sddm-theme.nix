{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGithub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "025705b3296d478e74d1041e4495e7a4ae466f92";
    sha256 = "01hmnskkkri2vxxp01yj270l9fnyngdlazvv3ip8hmhhv5xm0faa";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
