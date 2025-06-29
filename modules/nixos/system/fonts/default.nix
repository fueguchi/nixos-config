{ pkgs, ... }:
{
  imports = [ ./non-pkgs ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.mononoki
    nerd-fonts.geist-mono
    maple-mono.truetype
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts
    fira-code
    mona-sans
    dm-mono
  ];
}
