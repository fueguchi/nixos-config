{ pkgs, ... }:
{
  imports = [ ./non-pkgs ];
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Terminus" "VictorMono" "JetBrainsMono" "Mononoki" "GeistMono" "Hermit" "IntelOneMono" ]; })
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts
    monocraft
  ];
}
