{ pkgs, ... }:
{
  imports = [
    ./pywal
    ./kitty.nix
    ./btop.nix
    ./yazi.nix
    ./cava.nix
    ./ani-cli.nix
  ];

  home.packages = with pkgs; [
    grim
    wl-clipboard
    slurp
    swww
    eza
    duf
    ffmpeg-full
    brightnessctl
    speedtest-cli
  ];
}
