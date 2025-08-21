{
  stdenv,
  pkgs,
  ...
}: {
  # not working, idk what im doing wrong here
  where-is-my-sddm-theme = stdenv.mkDerivation rec {
    pname = "where-is-my-sddm-theme";
    version = "v1.12.0";
    dontBuild = true;
    src = pkgs.fetchFromGitHub {
      owner = "stepanzubkov";
      repo = "where-is-my-sddm-theme";
      rev = "2fddf85ec80ff02a8e20fdcba51a30b436d76e6c";
      sha256 = "sha256-SNCgpgPyJf9tKE6UyvmEpSJbIfLmAmPazTF85j0W7a0=";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -R $src $out/share/sddm/themes/${pname}
    '';
  };
}
