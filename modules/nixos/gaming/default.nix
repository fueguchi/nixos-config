{ 
  lib, 
  config, 
  pkgs, 
  inputs, 
  ... 
}: {
  options.gaming = {
    minecraft.enable = lib.mkEnableOption "enable minecraft (prismlauncher)";
    heroic.enable = lib.mkEnableOption "enable heroic launcher";
    osu.enable = lib.mkEnableOption "enable osu";
    r2mod.enable = lib.mkEnableOption "enable r2modman";
    steam.enable = lib.mkEnableOption "enable steam";
    gamemode.enable = lib.mkEnableOption "enable gamemode";
  };

  config = {
    environment.systemPackages = with pkgs;
    (lib.optionals
      config.gaming.minecraft.enable [ prismlauncher ]) ++ 
    (lib.optionals
      config.gaming.heroic.enable [ heroic ]) ++
    (lib.optionals
      config.gaming.osu.enable [ inputs.nix-gaming.packages.${pkgs.system}.osu-stable ]) ++ 
    (lib.optionals
      config.gaming.r2mod.enable [ r2modman ]);
    
    programs.steam = lib.mkIf config.gaming.steam.enable {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall = true;
      platformOptimizations.enable = true;
      extraPackages = [ pkgs.gamescope ];
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    programs.gamescope = lib.mkIf config.gaming.steam.enable {
      enable = true;
      capSysNice = false;
    };

    programs.gamemode = lib.mkIf config.gaming.gamemode.enable {
      enable = true;
      enableRenice = true;
      settings = {
        general = {
          renice = 10;
        };
        
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'Gamemode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'Gamemode ended'";
        };
      };
    };

    services.zerotierone = lib.mkIf config.gaming.minecraft.enable {
      enable = true;
    };
  };
}
