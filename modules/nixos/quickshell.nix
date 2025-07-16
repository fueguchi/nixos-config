{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    kdePackages.qtsvg
    kdePackages.qtimageformats
    kdePackages.qtmultimedia
    kdePackages.qt5compat
    kdePackages.qtdeclarative
    aubio
  ];
}
