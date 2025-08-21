{
  config,
  quickshell,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    quickshell.packages.${system}.default
  ];
  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/modules/home/desktop/quickshell/config";
  };
}
