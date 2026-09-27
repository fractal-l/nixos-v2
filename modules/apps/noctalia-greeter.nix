{
  inputs,
  system,
  settings,
  theme,
  ...
}: {
  imports = [inputs.noctalia-greeter.nixosModules.default];

  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${system}.default;
    settings = {
      appearance = {
        # A complete declarative palette wins over anything Sync writes.
        scheme = "Synced";
        theme_mode = "dark";
        font_family = theme.fonts.sans;
        password_style = "random";
        palette = theme.greeter;
        wallpaper = {
          path = "color:${theme.palette.bg}";
          fill_mode = "crop";
        };
      };
      output.scale = 1.2;
      keyboard = settings.xkb;
      cursor = {
        theme = theme.cursor.name;
        size = theme.cursor.size;
      };
    };
  };
}
