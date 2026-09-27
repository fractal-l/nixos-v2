{
  pkgs,
  theme,
  ...
}: {
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.iosevka
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig = {
    enable = true;
    cache32Bit = true;
    defaultFonts = {
      serif = [theme.fonts.sans];
      sansSerif = [theme.fonts.sans];
      monospace = [theme.fonts.mono];
    };
  };

  # Cursor theme and icon theme must be installed system-wide so the
  # greeter (running as the greetd user) can resolve them.
  environment.systemPackages = with pkgs; [
    capitaine-cursors
    adwaita-icon-theme
  ];
}
