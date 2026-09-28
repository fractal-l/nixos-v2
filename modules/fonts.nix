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

  # Cursor theme and icon theme must be system-wide for the greeter.
  environment.systemPackages = with pkgs; [
    capitaine-cursors
    adwaita-icon-theme
  ];
}
