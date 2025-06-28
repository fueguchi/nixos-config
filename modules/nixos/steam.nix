{ pkgs, config, lib, ... }:
{
  options = {
    steam.enable = lib.mkEnableOption "enable steam module";
  };
  config = lib.mkIf config.steam.enable {
    
    programs = {

      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];
      };
      
      gamemode = {
        enable = true;
        enableRenice = true;
      };

      gamescope = {
        enable = true;
        capSysNice = false;
      };
      
    };
  };
}
