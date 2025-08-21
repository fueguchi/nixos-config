{ 
  pkgs,
  ... 
}: {
  services.swayosd = {
    enable = true;
    package = pkgs.swayosd;
    stylePath = "/home/erik/.dotfiles/home/programs/swayosd/themes/theme-1/style.css";
  };
}