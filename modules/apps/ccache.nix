{...}: {
  programs.ccache = {
    enable = true;
    cacheDir = "/var/cache/ccache";
  };

  nix.settings.extra-sandbox-paths = [
    "/var/cache/ccache"
  ];

  environment.variables = {
    CCACHE_DIR = "/var/cache/ccache";
  };
}
