{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";
      ExtensionSettings = with builtins; let
        extension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      in
        listToAttrs [
          (extension "ublock origin" "uBlock0@raymondhill.net")
          (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          (extension "darkreader" "addon@darkreader.org")
          (extension "material-icons-for-github" "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}")
        ] // { "*".installation_mode = "allow"; };
    };
      profiles.erik = {
        name = "erik";
        id = 0;
        isDefault = true;
          bookmarks = {
            force = true;
            settings = [
              {
                name = "google";
                url = "https://google.com";
              }
            ];
          };
        settings = {
          # file picker
          "widget.use-xdg-desktop-portal.file-picker" = 1;

          # scroll config
          "mousewheel.default.delta_multiplier_y" = 500;
          "mousewheel.system_scroll_override.enabled" = false;
          
          # health care
          "sidebar.verticalTabs" = true;
          "sidebar.expandOnHover" = true;
          "general.autoScroll" = true;
          
          # enable webgl
          "webgl.disabled" = false;

          # enable gpu acceleration
          "layers.acceleration.force-enabled" = true;
          "gfx.webrender.all" = true;

          # HTTPS only
          "dom.security.https_only_mode" = true;

          # Enable dark mode in private windows
          "browser.theme.dark-private-windows" = true;
          "extensions.activeThemeID" = "firefox-dark@mozilla.org";

          # UX polish
          "general.smoothScroll" = true;
          "toolkit.cosmeticAnimations.enabled" = false;

          
          # Disable telemetry & reporting
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.archive.enabled" = false;
          
          # Privacy and tracking protection
          "privacy.resistFingerprinting" = false;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.trackingprotection.cryptominings.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;

          "content.notify.interval" = 100000;
          "gfx.canvas.accelerated.cache-size" = 512;
          "gfx.content.skia-font-cache-size" = 20;
          "browser.cache.disk.enable" = false;
          "browser.sessionhistory.max_total_viewers" = 4;
          "media.memory_cache_max_size" = 65536;
          "media.cache_readahead_limit" = 7200;
          "media.cache_resume_threshold" = 3600;
          "image.mem.decode_bytes_at_a_time" = 32768;
          "network.http.max-connections" = 1800;
          "network.http.max-persistent-connections-per-server" = 10;
          "network.http.max-urgent-start-excessive-connections-per-host" = 5;
          "network.http.pacing.requests.enabled" = false;
          "network.dnsCacheExpiration" = 3600;
          "network.ssl_tokens_cache_capacity" = 10240;
          "network.http.speculative-parallel-limit" = 0;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.places.speculativeConnect.enabled" = false;
          "network.prefetch-next" = false;
          "network.predictor.enabled" = false;
          "network.predictor.enable-prefetch" = false;
          "layout.css.grid-template-masonry-value.enabled" = true;

          "browser.privatebrowsing.vpnpromourl" = "";
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.preferences.moreFromMozilla" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.aboutwelcome.enabled" = false;
          "browser.profiles.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.compactmode.show" = true;
          "browser.privateWindowSeparation.enabled" = false; 
          "full-screen-api.transition-duration.enter" = "0 0";
          "full-screen-api.transition-duration.leave" = "0 0";
          "full-screen-api.warning.timeout" = 0;
          "browser.urlbar.unitConversion.enabled" = true;
          "browser.urlbar.trending.featureGate" = false;
          "dom.text_fragments.create_text_fragment.enabled" = true;
          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "extensions.pocket.enabled" = false;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.open_pdf_attachments_inline" = true;
          "browser.bookmarks.openInTabClosesMenu" = false;
          "browser.menu.showViewImageInfo" = true;
          "findbar.highlightAll" = true;
          "layout.word_select.eat_space_to_next_word" = false;
        };
    };
  };
}
