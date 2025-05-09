{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      #gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    #gamecospe = { # not working well on NixOS 24.11
    #  enable = true;
    #  capSysNice = true;
    #};
  };
}
 
