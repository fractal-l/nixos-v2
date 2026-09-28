{
  lib,
  pkgs,
  theme,
  config,
  ...
}: let
  p = theme.palette;
in {
  # Cursor (Wayland + Xwayland + GTK).
  home.pointerCursor = {
    name = theme.cursor.name;
    package = pkgs.capitaine-cursors;
    size = theme.cursor.size;
    gtk.enable = true;
    x11.enable = true;
  };

  # GTK 3.
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    font = {
      name = theme.fonts.sans;
      size = 11;
    };
  };

  # GTK 4 / libadwaita and everything else that reads GNOME settings.
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    gtk-theme = "adw-gtk3-dark";
    icon-theme = "Adwaita";
    cursor-theme = theme.cursor.name;
    cursor-size = theme.cursor.size;
    font-name = "${theme.fonts.sans} 11";
  };

  # Qt apps read this via QT_QPA_PLATFORMTHEME=qt6ct (set in mango env).
  xdg.configFile."qt6ct/colors/ash.conf".text = let
    active = lib.concatStringsSep ", " [
      p.fg # windowText
      p.overlay # button
      "#ffffff" # light
      "#cacaca" # midlight
      "#9f9f9f" # dark
      "#b8b8b8" # mid
      p.fg # text
      "#ffffff" # brightText
      p.fg # buttonText
      p.bg # base
      p.surface # window
      p.shadow # shadow
      p.accent # highlight
      p.bg # highlightedText
      p.blue # link
      p.magenta # linkVisited
      p.overlay # alternateBase
      p.surface # (unused role)
      p.overlay # toolTipBase
      p.fg # toolTipText
      p.fg-dim # placeholderText
      p.accent # accent
    ];
    disabled = lib.concatStringsSep ", " [
      p.fg-dim # windowText
      p.overlay # button
      "#ffffff" # light
      "#cacaca" # midlight
      "#9f9f9f" # dark
      "#b8b8b8" # mid
      p.fg-dim # text
      "#ffffff" # brightText
      p.fg-dim # buttonText
      p.bg # base
      p.surface # window
      p.shadow # shadow
      p.accent-dim # highlight
      p.bg # highlightedText
      p.blue # link
      p.magenta # linkVisited
      p.overlay # alternateBase
      p.surface # (unused role)
      p.overlay # toolTipBase
      p.fg-muted # toolTipText
      p.fg-dim # placeholderText
      p.accent-dim # accent
    ];
  in ''
    [ColorScheme]
    active_colors=${active}
    disabled_colors=${disabled}
    inactive_colors=${active}
  '';

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/qt6ct/colors/ash.conf
    custom_palette=true
    icon_theme=Adwaita
    style=Fusion
  '';
}
