{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.git-credential-manager ];
  programs.git = {
    enable = true;
    config = {
      credential = {
        helper = "manager";
        credentialStore = "secretservice";
      };
      
      init.defaultBranch = "master";

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
}
