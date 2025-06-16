{ pkgs, ... }:
{
  programs.zerotierone = {
    enable = true;
    package = pkgs.zerotierone;
  };
}
