{ lib, config, pkgs, inputs, ... }:
{
  options.gaming = {
    minecraft.enable = lib.mkEnableOption "enable minecraft (prismlauncher)";
    heroic.enable = lib.mkEnableOption "enable heroic launcher";
    osu.enable = lib.mkEnableOption "enable osu";
    r2mod.enable = lib.mkEnableOption "enable r2modman";
    steam.enable = lib.mkEnableOption "enable steam";
    gamemode.enable = lib.mkEnableOption "enable gamemode";
  };
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];
  config = let cfggaming = config.gaming;
  in {
    environment.systemPackages = with pkgs;
    (lib.optionals cfggaming.minecraft.enable [
      primslauncher
    ]) ++ (lib.optionals cfggaming.heroic.enable [
      heroic
    ]) ++ (lib.optionals cfggaming.osu.enable [
      inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    ]) ++ (lib.optionals cfggaming.r2mod.enable [
      r2modman
    ]);
    programs.steam = lib.mkIf cfggaming.steam.enable {
        enable = true;
        protontricks.enable = true;
        remotePlay.openFirewall = true;
        gamescopeSession.enable = true;
        platformOptimizations.enable = true;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
    programs.gamescope = lib.mkIf cfggaming.steam.enable {
      enable = true;
      capSysNice = false;
    };
    programs.gamemode = lib.mkIf cfggaming.gamemode.enable {
      enable = true;
      enableRenice = true;
    };
  };
}
