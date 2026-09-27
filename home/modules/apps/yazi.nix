{
  theme,
  ...
}: let
  p = theme.palette;
in {
  programs.yazi = {
    enable = true;

    theme = {
      mgr = {
        cwd = {fg = p.accent;};
        hovered = {
          fg = p.bg;
          bg = p.accent;
        };
        find_keyword = {
          fg = p.yellow;
          bold = true;
        };
        find_position = {
          fg = p.magenta;
          bg = "reset";
          bold = true;
        };
        marker_selected = {
          fg = p.accent;
          bg = p.accent;
        };
        marker_copied = {
          fg = p.yellow;
          bg = p.yellow;
        };
        marker_cut = {
          fg = p.red;
          bg = p.red;
        };
        count_copied = {fg = p.yellow;};
        count_cut = {fg = p.red;};
        count_selected = {fg = p.accent;};
        border_style = {fg = p.border;};
        tabs_active = {
          fg = p.bg;
          bg = p.accent;
          bold = true;
        };
        tabs_inactive = {fg = p.fg-dim;};
      };

      mode = {
        normal_main = {
          fg = p.bg;
          bg = p.accent;
          bold = true;
        };
        normal_alt = {
          fg = p.fg;
          bg = p.border-hi;
        };
        select_main = {
          fg = p.bg;
          bg = p.blue;
          bold = true;
        };
        select_alt = {
          fg = p.fg;
          bg = p.border-hi;
        };
        unset_main = {
          fg = p.bg;
          bg = p.red;
          bold = true;
        };
        unset_alt = {
          fg = p.fg;
          bg = p.border-hi;
        };
      };

      which = {
        cand = {fg = p.accent;};
        rest = {fg = p.fg-dim;};
        desc = {fg = p.fg-muted;};
        separator_style = {fg = p.border;};
      };

      input = {
        border = {fg = p.accent;};
        title = {fg = p.accent;};
        value = {fg = p.fg;};
      };

      confirm = {
        border = {fg = p.yellow;};
        title = {fg = p.yellow;};
        list = {fg = p.fg;};
        btn_yes = {
          fg = p.bg;
          bg = p.accent;
        };
        btn_no = {fg = p.fg-muted;};
      };

      pick = {
        border = {fg = p.border;};
        active = {
          fg = p.bg;
          bg = p.accent;
        };
      };

      help = {
        on = {fg = p.accent;};
        exec = {fg = p.fg;};
        desc = {fg = p.fg-muted;};
        hovered = {
          fg = p.bg;
          bg = p.accent;
        };
      };
    };
  };
}
