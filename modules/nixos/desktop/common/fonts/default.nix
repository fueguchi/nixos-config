{
  pkgs,
  ...   
}: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    #nerd-fonts.geist-mono
    #maple-mono.truetype
    sf-mono-liga-bin
    #ubuntu-sans
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts
    #fira-code
    #hack-font
    dm-mono
    material-symbols
    inconsolata
  ];
}
