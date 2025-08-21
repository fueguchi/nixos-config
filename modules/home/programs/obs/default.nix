{
  pkgs,
  ...
}: {
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
    plugins = with pkgs.obs-studio-plugins; [
      input-overlay
      #obs-backgroundremoval
      #obs-composite-blur
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };
}