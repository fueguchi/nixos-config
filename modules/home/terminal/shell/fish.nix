{
  pkgs, 
  ...
}: {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    interactiveShellInit = ''
      set fish_greeting
    '';

    #functions = {
    #  cd-completion = ''
    #    function __fish_my_cd_complete
    #      ls -d -- */ | xargs -n 1 basename
    #    end
    #      complete -c cd -a "(__fish_my_cd_complete)"
    #  '';
    #};
  };
  programs.starship.enable = true;
}
