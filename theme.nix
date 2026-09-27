# Central theme definition — the single source of truth for every color,
# font, and cursor decision in this configuration.
#
# "ash" — warm charcoal neutrals with a single sage accent.
#
# All contrast ratios are WCAG-verified against the darkest background:
#   fg       12.75:1   fg-muted  7.52:1   fg-dim   4.01:1
#   accent    8.80:1   red       5.43:1   blue     6.32:1
#   yellow    8.97:1   magenta   6.28:1   cyan     7.61:1
# Dark text (#131211) on accent / tertiary / error fills: 8.80 / 6.32 / 5.43:1.
#
# This file is pure data (plus small derivation helpers) so it can be
# imported by both NixOS-level and home-manager-level modules through
# the `theme` special argument.
rec {
  name = "ash";

  palette = rec {
    # Neutral ramp — warm charcoal (OKLCH hue ~85°, chroma <= 0.006).
    bg = "#131211"; # deepest: terminals, editors, wallpaper
    surface = "#1B1A18"; # bar, window chrome, app surfaces
    overlay = "#232220"; # cards, popovers, menus
    border = "#2E2C29"; # hairline outlines, hover fills
    border-hi = "#4A463F"; # emphasized borders, secondary pill fills

    fg = "#D8D5CC"; # primary text
    fg-muted = "#A8A499"; # secondary text
    fg-dim = "#787468"; # hints, comments

    # Single accent + low-chroma status hues.
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

  # Terminal ANSI palette (normal + bright).
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

  # ----------------------------------------------------------------------
  # Derived per-application color structures.

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

  # noctalia-shell custom palette (JSON under ~/.config/noctalia/palettes/):
  # m*-prefixed role keys + a `terminal` block.
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
