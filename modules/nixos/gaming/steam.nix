{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
    gamescope = { 
      enable = true;
      capSysNice = true;
    };
  };
  environment.systemPackages = with pkgs; [
    gamescope-wsi
  ];
}
 
