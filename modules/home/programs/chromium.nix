{
  pkgs, 
  ... 
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden password manager
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
      { id = "dlnejlppicbjfcfcedcflplfjajinajd"; } # bonjour startpage
    ]; 

    commandLineArgs = [
      # enable features
      "--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder"
      
      # disable features
      "--disable-features=AutofillSavePaymentMethods"
    ];
  };
}