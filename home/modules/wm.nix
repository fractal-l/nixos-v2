{
  lib,
  settings,
  theme,
  config,
  system,
  pkgs,
  inputs,
  ...
}: let
  noctalia-shell-bin = lib.getExe inputs.noctalia-shell.packages.${system}.default;
  throne-bin = lib.getExe pkgs.throne;
  ayugram-desktop-bin = lib.getExe inputs.ayugram-desktop.packages.${system}.default;
  alacritty-bin = lib.getExe pkgs.alacritty;
  element-desktop-bin = lib.getExe pkgs.element-desktop;
  vesktop-bin = lib.getExe pkgs.vesktop;
in {
  imports = [inputs.mangowm.hmModules.mango];
  wayland.windowManager.mango = {
    enable = true;
    settings = let
      m = theme.mango;
    in {
      monitorrule = [
        "name:DP-1,width:1920,height:1080,refresh:165,x:0,y:0,vrr:1"
        "name:DVI-D-1,width:1920,height:1080,refresh:60,x:1920,y:0,vrr:0"
      ];

      repeat_delay = 300;

      xkb_rules_layout = settings.xkb.layout;
      xkb_rules_variant = settings.xkb.variant;
      xkb_rules_options = settings.xkb.options;

      mouse_accel_profile = 0;

      syncobj_enable = 1;

      focus_on_activate = 1;
      allow_tearing = 1;
      drag_tile_to_tile = 1;

      animations = 1;

      animation_type_open = "zoom";
      animation_type_close = "zoom";

      animation_fade_in = 1;
      animation_fade_out = 1;
      fadein_begin_opacity = 0.0;
      fadeout_begin_opacity = 1.0;

      tag_animation_direction = 1;

      zoom_initial_ratio = 0.85;
      zoom_end_ratio = 1.0;

      animation_duration_open = 200;
      animation_duration_close = 150;
      animation_duration_move = 150;
      animation_duration_tag = 200;
      animation_duration_focus = 0;

      animation_curve_open = "0.22, 1, 0.36, 1";
      animation_curve_close = "0.22, 1, 0.36, 1";
      animation_curve_move = "0.22, 1, 0.36, 1";
      animation_curve_tag = "0.22, 1, 0.36, 1";
      animation_curve_focus = "0.22, 1, 0.36, 1";
      animation_curve_opafadeout = "0.22, 1, 0.36, 1";
      animation_curve_opafadein = "0.22, 1, 0.36, 1";

      gappih = 8;
      gappiv = 8;
      gappoh = 8;
      gappov = 8;

      borderpx = 1;
      border_radius = 12;

      rootcolor = m.rootcolor;
      bordercolor = m.bordercolor;
      focuscolor = m.focuscolor;
      urgentcolor = m.urgentcolor;
      splitcolor = m.splitcolor;
      dropcolor = m.dropcolor;

      maximizescreencolor = m.maximizescreencolor;
      scratchpadcolor = m.scratchpadcolor;
      globalcolor = m.globalcolor;
      overlaycolor = m.overlaycolor;

      jump_label_decorate_fg_color = m.jump.fg;
      jump_label_decorate_bg_color = m.jump.bg;
      jump_label_decorate_focus_fg_color = m.jump.focus-fg;
      jump_label_decorate_focus_bg_color = m.jump.focus-bg;
      jump_label_decorate_border_color = m.jump.border;

      group_bar_decorate_fg_color = m.group.fg;
      group_bar_decorate_bg_color = m.group.bg;
      group_bar_decorate_focus_fg_color = m.group.focus-fg;
      group_bar_decorate_focus_bg_color = m.group.focus-bg;
      group_bar_decorate_border_color = m.group.border;

      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
      blur_params_num_passes = 2;
      blur_params_radius = 5;
      blur_params_noise = 0.02;
      blur_params_brightness = 0.9;
      blur_params_contrast = 0.9;
      blur_params_saturation = 1.0;

      layer_animations = 0;
      shadows = 1;
      layer_shadows = 0;
      shadow_only_floating = 0;
      shadows_size = 4;
      shadows_blur = 12;
      shadows_position_x = 2;
      shadows_position_y = 2;
      shadowscolor = "0x000000ff";

      focused_opacity = 1;
      unfocused_opacity = 0.92;

      cursor_size = theme.cursor.size;
      cursor_theme = theme.cursor.name;

      env = [
        "NIXOS_OZONE_WL,1"

        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_ENABLE_HIGHDPI_SCALING,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,0"
        "QT_SCALE_FACTOR,1.2"

        "GDK_SCALE,1"
        "GDK_DPI_SCALE,1.2"
        "GDK_BACKEND,wayland"

        "XCURSOR_SIZE,${toString theme.cursor.size}"

        "__GL_SHADER_DISK_CACHE,1"
        "__GL_SHADER_DISK_CACHE_PATH,$HOME/.nv/GLCache"
        "__GL_SHADER_DISK_CACHE_SKIP_CLEANUP,1"
      ];

      exec-once = [
        "${noctalia-shell-bin}"
        "${throne-bin}"
        "${ayugram-desktop-bin} -autostart"
        "${element-desktop-bin} --no-update --hidden"
        "${vesktop-bin} -m --ozone-platform wayland"
      ];

      bind = [
        "SUPER,Return,spawn,${alacritty-bin}"
        "SUPER,Space,spawn_shell,${noctalia-shell-bin} msg panel-open launcher"
        "SUPER+ALT,Space,spawn_shell,${noctalia-shell-bin} msg TODO"
        "SUPER,code:60,spawn_shell,${noctalia-shell-bin} msg panel-open launcher /emo"

        "SUPER,Q,killclient"
        "SUPER+SHIFT,R,reload_config"
        "SUPER+SHIFT,W,spawn_shell,pkill -9 noctalia; ${noctalia-shell-bin}"

        "SUPER,L,spawn,${noctalia-shell-bin} msg session lock"

        "SUPER,Print,spawn,${noctalia-shell-bin} msg screenshot-region"

        "SUPER,1,view,1"
        "SUPER,2,view,2"
        "SUPER,3,view,3"
        "SUPER,4,view,4"
        "SUPER,5,view,5"
        "SUPER,6,view,6"
        "SUPER,7,view,7"
        "SUPER,8,view,8"
        "SUPER,9,view,9"
        "SUPER,0,view,10"

        "SUPER+SHIFT,1,tag,1"
        "SUPER+SHIFT,2,tag,2"
        "SUPER+SHIFT,3,tag,3"
        "SUPER+SHIFT,4,tag,4"
        "SUPER+SHIFT,5,tag,5"
        "SUPER+SHIFT,6,tag,6"
        "SUPER+SHIFT,7,tag,7"
        "SUPER+SHIFT,8,tag,8"
        "SUPER+SHIFT,9,tag,9"
        "SUPER+SHIFT,0,tag,10"

        "SUPER,Left,resizewin,-20,0"
        "SUPER,Right,resizewin,20,0"
        "SUPER,Up,resizewin,0,-20"
        "SUPER,Down,resizewin,0,20"

        "SUPER+SHIFT,Left,tagmon,DP-1"
        "SUPER+SHIFT,Right,tagmon,DVI-D-1"

        "SUPER,V,togglefloating"
        "SUPER,O,toggleoverlay"
        "SUPER,F,togglefullscreen"

        "NONE,XF86AudioMute,spawn_shell,${noctalia-shell-bin} msg volume-mute"
        "NONE,XF86AudioRaiseVolume,spawn_shell,${noctalia-shell-bin} msg volume-up 5"
        "NONE,XF86AudioLowerVolume,spawn_shell,${noctalia-shell-bin} msg volume-down 5"
        "NONE,XF86AudioPlay,spawn_shell,${noctalia-shell-bin} msg media toggle"
        "NONE,XF86AudioPrev,spawn_shell,${noctalia-shell-bin} msg media previous"
        "NONE,XF86AudioNext,spawn_shell,${noctalia-shell-bin} msg media next"
        "SUPER,XF86AudioRaiseVolume,spawn_shell,${noctalia-shell-bin} msg brightness-up all 5"
        "SUPER,XF86AudioLowerVolume,spawn_shell,${noctalia-shell-bin} msg brightness-down all 5"
      ];

      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
      ];
    };
  };
}
