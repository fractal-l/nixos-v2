{pkgs, ...}: {
  services.dbus.enable = true;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];

    configPackages = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
        ControllerMode = "dual";
      };
    };
  };

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;

    wireplumber = {
      enable = true;

      extraConfig = {
        bluetooth = {
          "10-bluetooth-config" = {
            "monitor.bluez.properties" = {
              "bluez5.enable-sbc-xq" = true;
              "bluez5.enable-msbc" = false;
              "bluez5.enable-hw-volume" = true;

              "bluez5.enable-hfp" = false;
              "bluez5.enable-hsp" = false;
              "bluez5.enable-sco" = false;

              "bluez5.roles" = [
                "a2dp_sink"
                "a2dp_source"
              ];
            };
          };

          "20-bluetooth-policy" = {
            "monitor.bluez.rules" = [
              {
                matches = [
                  {
                    "device.name" = "~bluez_card.*";
                  }
                ];

                actions = {
                  update-props = {
                    "device.profile" = "a2dp-sink";
                  };
                };
              }
            ];
          };
        };

        pipewire = {
          "99-performance" = {
            "context.properties" = {
              "default.clock.rate" = 48000;
              "default.clock.quantum" = 512;
              "default.clock.min-quantum" = 32;
              "default.clock.max-quantum" = 1024;
            };
          };
        };

        pipewire-pulse = {
          "99-pulse" = {
            "pulse.properties" = {
              "pulse.min.req" = "512/48000";
              "pulse.default.req" = "512/48000";
              "pulse.max.req" = "1024/48000";
            };
          };
        };
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  services.logind.settings = {
    Login = {
      IdleAction = "hybrid-sleep";
      IdleActionSec = "30min";
    };
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_DRM_NO_ATOMIC = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
