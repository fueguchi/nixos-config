{
  pkgs,
  config,
  lib,
  ...
}: {
  options.virt.docker.enable = lib.mkEnableOption "enable docker";
  config = lib.mkIf config.virt.docker.enable {
    virtualisation.docker = {
      enable = true;
      package = pkgs.docker;
    };
  };
}