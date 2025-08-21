{
  pkgs,
  ...
}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions.fzf-native.enable = true;
    settings = {
      defaults = {
        vimgrep_arguments = [ "${pkgs.ripgrep}/bin/rg" ];
        file_ignore_patterns = [ "^.git/" "^.mypy_cache/" "^__pycache__/" "^output/" "^data/" "%.ipynb" ];
      };
    };
  };
}
