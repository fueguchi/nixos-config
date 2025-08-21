{ 
  config, 
  pkgs,
  ... 
}: {
  imports = [
    ../../modules/home/desktop
    ../../modules/home/programs
    ../../modules/home/terminal
    ./.
  ];

  hyprl.animations = {
    disable = true;
    default-config.enable = false;
    der-andere.enable = false;
    dreamy.enable = false;
    horizontal-fade.enable = false;
    sane1090x.enable = false;
    smooth-animation.enable = false;
  };
  
  media = {
    spotify.enable = true;
    spicetify.enable = false;
  };
  
  home = {
    username = "erik";
    homeDirectory = "/home/erik";  
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
