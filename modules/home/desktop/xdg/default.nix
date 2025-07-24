{ hostVars, ... }:
{
  xdg.userDirs = {
    enable = true;
    desktop = hostVars.homeDirectory;
    downloads = hostVars.homeDirectory;
    documents = hostVars.homeDirectory;
    videos = hostVars.homeDirectory;
    pictures = hostVars.homeDirectory;
    music = hostVars.homeDirectory;
    templates = hostVars.homeDirectory;
    publicShare = hostVars.homeDirectory;
  };
}
