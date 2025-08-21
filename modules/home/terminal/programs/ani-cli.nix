{ 
  pkgs, 
  ... 
}: {
  home.packages = with pkgs; [
    ani-cli
    aria2
    fzf
    mpv
    ffmpeg-full
  ];
}