{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
      DisablePocket = true;
      SearchBar = "unified";

      Preferences = {
        "browser.cache.memory.enable" = true;
        "browser.cache.memory.capacity" = 512000;
        "browser.cache.disk.enable" = false;
        "network.prefetch-next" = false;
        "browser.sessionhistory.max_total_viewers" = 0;
        "browser.sessionstore.interval" = 15000;
        "browser.sessionhistory.max_entries" = 5;
        "extensions.pocket.enabled" = false;
        "accessibility.force_disabled" = 1;
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
