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
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          (extension "darkreader" "addon@darkreader.org")
          (extension "material-icons-for-github" "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}")
        ] // { "*".installation_mode = "allow"; };
    };
    profiles.erik = {
      name = "erik";
      id = 0;
      isDefault = true;
        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
          engines = {
            bing.metaData.hidden = true;
            nix-packages = {
              name = "Nix Packages";
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };
            nix-options = {
              name = "Nix Options";
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "type"; value = "options"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@no"];
            };
            nixos-wiki = {
              name = "NixOS Wiki";
              urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
              iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
              definedAliases = ["@nw"];
            };
            google = {
              name = "Google";
              urls = [{ template = "https://www.google.com/search?q={searchTerms}"; }];
              iconMapObj."16" = "https://www.google.com/favicon.ico"; 
              definedAliases = ["@gg"];
            };
            home-manager-options = {
              name = "Home-manager options";
              urls = [{
                template = "https://home-manager-options.extranix.com/";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "https://home-manager-options.extranix.com/favicon.ico";
              definedAliases = ["@hm"];
            };
          };
        };
        bookmarks = {
          force = true;
          settings = [{
            toolbar = true;
            bookmarks = [{
              name = "Nix";
              bookmarks = [
                { name = "Homepage"; url = "https://nixos.org/"; }
                { name = "Nix Manual"; url = "https://nix.dev/manual/nix/2.28/"; }
                { name = "Nix First Steps"; url = "https://nix.dev/tutorials/first-steps/"; }
                { name = "Nixpkgs Manual"; url = "https://nixos.org/manual/nixpkgs/stable/"; }
                { name = "NixOS Manual"; url = "https://nixos.org/manual/nixos/stable/"; }
                { name = "Nixvim Manual"; url = "https://nix-community.github.io/nixvim/"; }
                ];
            }];
          }
          {
            toolbar = true;
            bookmarks = [{
              name = "Dictionary";
              bookmarks = [
                { name = "english dictionary"; url = "https://dictionary.cambridge.org/dictionary/english/"; }
                { name = "dicionário de português"; url = "https://www.dicio.com.br/"; }
              ];
              }];
          }
          {
            toolbar = true;
            bookmarks = [{
              name = "Wiki";
              bookmarks = [
                { name = "Wikipedia"; url = "https://wikipedia.org/"; }
                { name = "Arch Wiki"; url = "https://wiki.archlinux.org/"; }
                { name = "Hypr Wiki"; url = "https://wiki.hypr.land/"; }
              ];
            }];
          }];
        };
      settings = {
        # enable css
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # file picker
        "widget.use-xdg-desktop-portal.file-picker" = 2;
       
        # scroll config
        "mousewheel.default.delta_multiplier_y" = 400;
        "mousewheel.system_scroll_override.enabled" = false;
        
        # health care
        "sidebar.verticalTabs" = true;
        "sidebar.expandOnHover" = true;
        "sidebar.revamp" = true;
        "sidebar.visibility" = "expand-on-hover";
        "general.autoScroll" = true;
        "sidebar.animation.expand-on-hover.duration-ms" = 200;
        "sidebar.main.tools" = "history,bookmarks";
        "browser.toolbars.bookmarks.visibility" = "always"; 
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
        
        # disable "save password" prompt
        "signon.rememberSignons" = false;

        # Disable irritating first-run stuff
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.feeds.showFirstRunUI" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.rights.3.shown" = true;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.uitour.enabled" = false;
        "startup.homepage_override_url" = "";
        "trailhead.firstrun.didSeeAboutWelcome" = true;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.bookmarks.addedImportButton" = true;
      };

      extraConfig = '' # just a copy paste of betterfox
        user_pref("content.notify.interval", 100000);
        user_pref("gfx.canvas.accelerated.cache-size", 512);
        user_pref("gfx.content.skia-font-cache-size", 20);
        user_pref("browser.cache.disk.enable", false);
        user_pref("browser.sessionhistory.max_total_viewers", 4);
        user_pref("media.memory_cache_max_size", 65536);
        user_pref("media.cache_readahead_limit", 7200);
        user_pref("media.cache_resume_threshold", 3600);
        user_pref("image.mem.decode_bytes_at_a_time", 32768);
        user_pref("network.http.max-connections", 1800);
        user_pref("network.http.max-persistent-connections-per-server", 10);
        user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
        user_pref("network.http.pacing.requests.enabled", false);
        user_pref("network.dnsCacheExpiration", 3600);
        user_pref("network.ssl_tokens_cache_capacity", 10240);
        user_pref("network.http.speculative-parallel-limit", 0);
        user_pref("network.dns.disablePrefetch", true);
        user_pref("network.dns.disablePrefetchFromHTTPS", true);
        user_pref("browser.urlbar.speculativeConnect.enabled", false);
        user_pref("browser.places.speculativeConnect.enabled", false);
        user_pref("network.prefetch-next", false);
        user_pref("network.predictor.enabled", false);
        user_pref("network.predictor.enable-prefetch", false);
        user_pref("layout.css.grid-template-masonry-value.enabled", true);
        user_pref("browser.contentblocking.category", "strict");
        user_pref("browser.download.start_downloads_in_tmp_dir", true);
        user_pref("browser.helperApps.deleteTempFileOnExit", true);
        user_pref("browser.uitour.enabled", false);
        user_pref("privacy.globalprivacycontrol.enabled", true);
        user_pref("security.OCSP.enabled", 0);
        user_pref("security.pki.crlite_mode", 2);
        user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
        user_pref("browser.xul.error_pages.expert_bad_cert", true);
        user_pref("security.tls.enable_0rtt_data", false);
        user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
        user_pref("browser.sessionstore.interval", 60000);
        user_pref("browser.privatebrowsing.resetPBM.enabled", true);
        user_pref("privacy.history.custom", true);
        user_pref("browser.urlbar.trimHttps", true);
        user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
        user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
        user_pref("browser.urlbar.update2.engineAliasRefresh", true);
        user_pref("browser.search.suggest.enabled", false);
        user_pref("browser.urlbar.quicksuggest.enabled", false);
        user_pref("browser.urlbar.groupLabels.enabled", false);
        user_pref("browser.formfill.enable", false);
        user_pref("network.IDN_show_punycode", true);
        user_pref("signon.formlessCapture.enabled", false);
        user_pref("signon.privateBrowsingCapture.enabled", false);
        user_pref("network.auth.subresource-http-auth-allow", 1);
        user_pref("editor.truncate_user_pastes", false);
        user_pref("security.mixed_content.block_display_content", true);
        user_pref("pdfjs.enableScripting", false);
        user_pref("extensions.enabledScopes", 5);
        user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
        user_pref("privacy.userContext.ui.enabled", true);
        user_pref("browser.safebrowsing.downloads.remote.enabled", false);
        user_pref("permissions.default.desktop-notification", 2);
        user_pref("permissions.default.geo", 2);
        user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
        user_pref("browser.search.update", false);
        user_pref("permissions.manager.defaultsUrl", "");
        user_pref("extensions.getAddons.cache.enabled", false);
        user_pref("datareporting.policy.dataSubmissionEnabled", false);
        user_pref("datareporting.healthreport.uploadEnabled", false);
        user_pref("toolkit.telemetry.unified", false);
        user_pref("toolkit.telemetry.enabled", false);
        user_pref("toolkit.telemetry.server", "data:,");
        user_pref("toolkit.telemetry.archive.enabled", false);
        user_pref("toolkit.telemetry.newProfilePing.enabled", false);
        user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
        user_pref("toolkit.telemetry.updatePing.enabled", false);
        user_pref("toolkit.telemetry.bhrPing.enabled", false);
        user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
        user_pref("toolkit.telemetry.coverage.opt-out", true);
        user_pref("toolkit.coverage.opt-out", true);
        user_pref("toolkit.coverage.endpoint.base", "");
        user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
        user_pref("browser.newtabpage.activity-stream.telemetry", false);
        user_pref("datareporting.usage.uploadEnabled", false);
        user_pref("app.shield.optoutstudies.enabled", false);
        user_pref("app.normandy.enabled", false);
        user_pref("app.normandy.api_url", "");
        user_pref("breakpad.reportURL", "");
        user_pref("browser.tabs.crashReporting.sendReport", false);
        user_pref("browser.privatebrowsing.vpnpromourl", "");
        user_pref("extensions.getAddons.showPane", false);
        user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
        user_pref("browser.discovery.enabled", false);
        user_pref("browser.shell.checkDefaultBrowser", false);
        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
        user_pref("browser.preferences.moreFromMozilla", false);
        user_pref("browser.aboutConfig.showWarning", false);
        user_pref("browser.aboutwelcome.enabled", false);
        user_pref("browser.profiles.enabled", true);
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        user_pref("browser.compactmode.show", true);
        user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS
        user_pref("full-screen-api.transition-duration.enter", "0 0");
        user_pref("full-screen-api.transition-duration.leave", "0 0");
        user_pref("full-screen-api.warning.timeout", 0);
        user_pref("browser.urlbar.unitConversion.enabled", true);
        user_pref("browser.urlbar.trending.featureGate", false);
        user_pref("dom.text_fragments.create_text_fragment.enabled", true);
        user_pref("browser.newtabpage.activity-stream.default.sites", "");
        user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
        user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
        user_pref("browser.newtabpage.activity-stream.showSponsored", false);
        user_pref("extensions.pocket.enabled", false);
        user_pref("browser.download.manager.addToRecentDocs", false);
        user_pref("browser.download.open_pdf_attachments_inline", true);
        user_pref("browser.bookmarks.openInTabClosesMenu", false);
        user_pref("browser.menu.showViewImageInfo", true);
        user_pref("findbar.highlightAll", true);
        user_pref("layout.word_select.eat_space_to_next_word", false);
      '';
    };
  };
}
