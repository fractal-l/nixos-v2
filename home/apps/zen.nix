{
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.default
  ];
  programs.zen-browser = {
    enable = true;
    package = inputs.zen-browser.packages.${system}.default;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = false;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      EncryptedMediaExtensions.Enabled = true;
      HardwareAcceleration = true;
      Preferences = {
        "browser.tabs.inTitlebar" = 1;
        "sidebar.verticalTabs" = true;
        "sidebar.revamp" = true;
        "zen.view.compact" = true;
        "zen.view.sidebar-expanded" = false;
        "zen.workspaces.enabled" = true;

        "browser.sessionstore.resume_from_crash" = true;
        "browser.cache.disk.enable" = false;
        "browser.cache.memory.enable" = true;

        "privacy.trackingprotection.enabled" = true;
        "privacy.resistFingerprinting" = false;
        "privacy.firstparty.isolate" = true;

        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.urlbar.defaultenginename" = "DuckDuckGo";

        # noctalia
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };

    profiles.fractal = {
      id = 0;
      name = "fractal";
      isDefault = true;

      extensions.packages = with inputs.firefox-addons.packages.${system}; [
        ublock-origin
        bitwarden
        darkreader
      ];

      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";

        "browser.urlbar.suggest.engines" = true;
        "browser.urlbar.suggest.history" = true;
        "browser.urlbar.suggest.bookmark" = true;

        "browser.tabs.closeWindowWithLastTab" = false;
        "browser.tabs.warnOnClose" = false;
      };
    };
  };
}
