{ pkgs, ... }:
{
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden password manager
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
      { id = "dlnejlppicbjfcfcedcflplfjajinajd"; } # bonjour startpage
    ];
    commandLineArgs = [
      "--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder" # make some videos being video encoded
    ];
  };
}
