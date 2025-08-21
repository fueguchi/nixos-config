{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.winapps.packages."${system}".winapps
    inputs.winapps.packages."${system}".winapps-launcher

    sqlitebrowser
    git-credential-manager
    networkmanagerapplet
    rofi
    duf

    python312Full
    gcc
    jdk24
    nodejs_24
    uv
  ];

  services.power-profiles-daemon.enable = true;

  zramSwap.enable = true;
  zramSwap.algorithm = "zstd"; 
  
  console.font = "Lat2-Terminus16";
  console.keyMap = "br-abnt2";

  programs.git = {
    enable = true;
    config = {
      credential = {
        helper = "manager";
        credentialStore = "secretservice";
      };

      init.defaultBranch = "main";

      url = {
        "https://github.com/" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
      };
    };
  };

  time.timeZone = "America/Cuiaba";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "ja_JP.UTF-8/UTF-8" ];
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };
  networking = {
    hostName = "wired";
    networkmanager.enable = true;
    firewall.enable = true;
    #nameservers = [ ]; # DNS change if needed
  };
}
