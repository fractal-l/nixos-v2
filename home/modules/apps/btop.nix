{
  theme,
  ...
}: let
  p = theme.palette;
in {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = theme.name;
      # Let the (translucent) terminal background show through.
      theme_background = false;
    };
  };

  xdg.configFile."btop/themes/${theme.name}.theme".text = ''
    theme[main_bg]="${p.bg}"
    theme[main_fg]="${p.fg}"
    theme[title]="${p.fg}"
    theme[hi_fg]="${p.accent}"
    theme[selected_bg]="${p.border-hi}"
    theme[selected_fg]="${p.fg}"
    theme[inactive_fg]="${p.fg-dim}"
    theme[graph_text]="${p.fg-dim}"
    theme[proc_misc]="${p.accent}"
    theme[cpu_box]="${p.border}"
    theme[mem_box]="${p.border}"
    theme[net_box]="${p.border}"
    theme[proc_box]="${p.border}"
    theme[div_line]="${p.border}"
    theme[temp_start]="${p.blue}"
    theme[temp_mid]="${p.yellow}"
    theme[temp_end]="${p.red}"
    theme[cpu_start]="${p.accent-dim}"
    theme[cpu_mid]="${p.accent}"
    theme[cpu_end]="${p.fg}"
    theme[free_start]="${p.fg-dim}"
    theme[free_mid]="${p.cyan}"
    theme[free_end]="${p.accent}"
    theme[cached_start]="${p.fg-dim}"
    theme[cached_mid]="${p.blue}"
    theme[cached_end]="#9CB4CB"
    theme[available_start]="${p.fg-dim}"
    theme[available_mid]="${p.blue}"
    theme[available_end]="#9CB4CB"
    theme[used_start]="${p.border-hi}"
    theme[used_mid]="${p.yellow}"
    theme[used_end]="${p.red}"
    theme[download_start]="${p.fg-dim}"
    theme[download_mid]="${p.cyan}"
    theme[download_end]="#A0C2BD"
    theme[upload_start]="${p.fg-dim}"
    theme[upload_mid]="${p.magenta}"
    theme[upload_end]="#C6A6C6"
  '';
}
