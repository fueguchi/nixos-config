{
  programs.nixvim.plugins.neocord = {
    enable = true;
    settings = {
      # General Options
      auto_update = true;
      logo = "https://raw.githubusercontent.com/fueguchi/nixos-config/refs/heads/main/modules/home/desktop/nixvim/plugins/etc/img-for-neocord/neovim-flake-logo-work.png";
      logo_tooltip = null;
      main_image = "language";
      client_id = "1157438221865717891";
      log_level = null;
      debounce_timeout = 10;
      blacklist = [];
      #file_assets = [];
      show_time = true;
      global_timer = false;

      # Rich Presence text options
      editing_text = "Editing %s";
      file_explorer_text = "Browsing %s";
      git_commit_text = "Committing changes";
      plugin_manager_text = "Managing plugins";
      reading_text = "Reading %s";
      workspace_text = "Working on %s";
      line_number_text = "Line %s out of %s";
      terminal_text = "Using Terminal";
    };
  };
}
