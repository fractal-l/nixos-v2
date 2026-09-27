{
  theme,
  ...
}: let
  p = theme.palette;
  a = theme.ansi;
in {
  programs.alacritty = {
    enable = true;

    settings = {
      general = {
        live_config_reload = true;
      };

      env.TERM = "xterm-256color";
      window = {
        padding = {
          x = 12;
          y = 12;
        };

        dynamic_padding = true;
        decorations = "None";
        opacity = 0.9;
        blur = true;
        startup_mode = "Windowed";
        dynamic_title = true;
      };

      scrolling = {
        history = 100000;
        multiplier = 5;
      };

      font = {
        normal = {
          family = theme.fonts.mono;
          style = "Medium";
        };

        bold.style = "Bold";
        italic.style = "Italic";
        bold_italic.style = "Bold Italic";
        size = 12.5;

        offset = {
          x = 0;
          y = 2;
        };

        glyph_offset = {
          x = 0;
          y = 1;
        };

        builtin_box_drawing = true;
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };

        blink_interval = 500;
        unfocused_hollow = true;
        thickness = 0.18;
      };

      mouse.hide_when_typing = true;
      terminal.osc52 = "CopyPaste";

      colors = {
        primary = {
          background = p.bg;
          foreground = p.fg;
        };
        cursor = {
          cursor = p.accent;
          text = p.bg;
        };
        selection = {
          background = p.accent;
          text = p.bg;
        };
        normal = a.normal;
        bright = a.bright;
      };

      keyboard.bindings = [
        {
          key = "Return";
          mods = "Control|Shift";
          action = "SpawnNewInstance";
        }

        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }

        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }

        {
          key = "Key0";
          mods = "Control";
          action = "ResetFontSize";
        }

        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }

        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }

        {
          key = "F";
          mods = "Control|Shift";
          action = "SearchForward";
        }

        {
          key = "Space";
          mods = "Control";
          action = "ToggleViMode";
        }
      ];
    };
  };
}
