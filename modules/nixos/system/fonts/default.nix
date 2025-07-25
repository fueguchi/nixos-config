{ pkgs, ... }:
{
  imports = [ ./non-pkgs ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    #nerd-fonts.geist-mono
    #maple-mono.truetype
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
