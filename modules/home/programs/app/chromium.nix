{ config, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden password manager
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
      { id = "dlnejlppicbjfcfcedcflplfjajinajd"; } # bonjour startpage
    ]; 

    commandLineArgs = [
      # enable features
      "--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder" # make some videos being video encoded
      
      # disable features
      "--disable-features=AutofillSavePaymentMethods"
    ];
  };
}
