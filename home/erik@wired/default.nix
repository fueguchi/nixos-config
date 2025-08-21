{
  pkgs, 
  ...
}: {
  programs.git = {
    enable = true;
    userEmail = "samenai@pm.me";
    userName = "erik";
  };
  
  home.packages = with pkgs; [
    libnotify
    gawk
    swaynotificationcenter
  ];
}
