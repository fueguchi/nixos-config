{ pkgs, ... }:
{
  programs.google-chrome = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = [
      "--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder"
    ];
  };
}
