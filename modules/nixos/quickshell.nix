{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.system}.default
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qtmultimedia
    qt6.qt5compat
    qt6.qtdeclarative
    aubio
  ];
}
