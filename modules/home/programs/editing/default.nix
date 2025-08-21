{
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.gimp
    pkgs.kdePackages.kdenlive
  ];
}