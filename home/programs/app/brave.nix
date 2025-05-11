{ pkgs, ... }:
{
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden password manager
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader

    ];
    commandLineArgs = [
      "--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder"
    ];
  };
}
