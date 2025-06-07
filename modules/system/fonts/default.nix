{ pkgs, ... }:
{
  imports = [ ./non-pkgs ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.mononoki
    nerd-fonts.geist-mono
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts
    mona-sans 
    maple-mono.truetype
    ubuntu-sans
  ];
}
