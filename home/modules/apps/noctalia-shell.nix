{
  pkgs,
  lib,
  system,
  inputs,
  theme,
  ...
}: {
  imports = [inputs.noctalia-shell.homeModules.default];

  programs.noctalia = {
    enable = true;

    # The palette lives in the central theme and is materialized as
    # ~/.config/noctalia/palettes/ash.json.
    customPalettes.${theme.name} = theme.noctalia;

    settings = let
      p = theme.palette;
    in {
      theme = {
        source = "custom";
        custom_palette = theme.name;
      };

      shell = {
        font_family = theme.fonts.sans;
        # Structure through hairline outlines, not heavy fills.
        button_borders = true;
        input_borders = true;
        popup_borders = true;
        card_borders = true;
        # Compositor-level window shadows are enabled in mango; keep shell
        # surfaces themselves flat (see the mango <--> noctalia interplay).
        popup_shadows = true;
      };

      shell.panel = {
        transparency_mode = "soft";
        shadow = false;
      };

      bar.default = {
        position = "top";
        # Thin, edge-to-edge, square: a quiet strip across the top.
        thickness = 30;
        margin_ends = 0;
        radius = 0;
        concave_edge_corners = false;
        background_opacity = 0.85;
        border = "outline";
        border_width = 1.0;
        shadow = false;
        contact_shadow = false;
      };

      notification = {
        background_opacity = 0.9;
        border = true;
      };

      wallpaper = {
        default.path = "color:${p.bg}";
        fill_color = p.bg;
      };
    };
  };

  home.packages = with pkgs; [
    mpvpaper
    cliphist
    wl-clipboard
  ];
}
