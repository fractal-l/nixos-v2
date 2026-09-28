rec {
  name = "ash";

  palette = rec {
    bg = "#131211"; # deepest: terminals, editors, wallpaper
    surface = "#1B1A18"; # bar, window chrome, app surfaces
    overlay = "#232220"; # cards, popovers, menus
    border = "#2E2C29"; # hairline outlines, hover fills
    border-hi = "#4A463F"; # emphasized borders, secondary pill fills

    fg = "#D8D5CC"; # primary text
    fg-muted = "#A8A499"; # secondary text
    fg-dim = "#787468"; # hints, comments

    accent = "#A3B98C"; # sage
    accent-dim = "#6E7F5C"; # decorative / secondary accent uses
    red = "#C97268";
    orange = "#C98A6B";
    yellow = "#C9B26B";
    blue = "#7E99B3";
    magenta = "#AE8AAE";
    cyan = "#85ADA8";

    shadow = "#0C0B0A";
  };

  ansi = {
    normal = {
      black = palette.surface;
      red = palette.red;
      green = palette.accent;
      yellow = palette.yellow;
      blue = palette.blue;
      magenta = palette.magenta;
      cyan = palette.cyan;
      white = palette.fg-muted;
    };
    bright = {
      black = palette.fg-dim;
      red = "#D98B82";
      green = "#BCCF9F";
      yellow = "#DCC784";
      blue = "#9CB4CB";
      magenta = "#C6A6C6";
      cyan = "#A0C2BD";
      white = palette.fg;
    };
  };

  fonts = {
    sans = "Inter";
    mono = "Iosevka Nerd Font Mono";
  };

  cursor = {
    name = "capitaine-cursors";
    size = 22;
  };

  # Mango compositor colors (0xRRGGBBAA strings).
  mango = let
    p = palette;
    mk = c: "0x${builtins.substring 1 6 c}ff";
  in {
    rootcolor = mk p.bg;
    bordercolor = mk p.border;
    focuscolor = mk p.accent;
    urgentcolor = mk p.red;
    splitcolor = mk p.border-hi;
    dropcolor = "0x00000066";
    maximizescreencolor = mk p.accent-dim;
    scratchpadcolor = mk p.blue;
    globalcolor = mk p.magenta;
    overlaycolor = mk p.cyan;
    jump = {
      fg = mk p.fg;
      bg = mk p.surface;
      focus-fg = mk p.bg;
      focus-bg = mk p.accent;
      border = mk p.accent;
    };
    group = {
      fg = mk p.fg;
      bg = mk p.surface;
      focus-fg = mk p.bg;
      focus-bg = mk p.accent;
      border = mk p.accent;
    };
  };

  # noctalia-shell custom palette: m*-prefixed roles + a `terminal` block.
  noctalia = let
    p = palette;
    a = ansi;
  in {
    dark = {
      mPrimary = p.accent;
      mOnPrimary = p.bg;
      mSecondary = p.border-hi;
      mOnSecondary = p.fg;
      mTertiary = p.blue;
      mOnTertiary = p.bg;
      mError = p.red;
      mOnError = p.bg;
      mSurface = p.surface;
      mOnSurface = p.fg;
      mSurfaceVariant = p.overlay;
      mOnSurfaceVariant = p.fg-muted;
      mOutline = p.border;
      mShadow = p.shadow;
      mHover = p.border;
      mOnHover = p.fg;
      terminal = {
        background = p.bg;
        foreground = p.fg;
        cursor = p.accent;
        cursorText = p.bg;
        selectionBg = p.accent;
        selectionFg = p.bg;
        normal = a.normal;
        bright = a.bright;
      };
    };
  };

  # noctalia-greeter [appearance.palette]: snake_case role keys.
  greeter = let
    p = palette;
  in {
    primary = p.accent;
    on_primary = p.bg;
    secondary = p.border-hi;
    on_secondary = p.fg;
    tertiary = p.blue;
    on_tertiary = p.bg;
    error = p.red;
    on_error = p.bg;
    surface = p.surface;
    on_surface = p.fg;
    surface_variant = p.overlay;
    on_surface_variant = p.fg-muted;
    outline = p.border;
    shadow = p.shadow;
    hover = p.border;
    on_hover = p.fg;
  };
}
