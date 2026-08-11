{
  lib,
  pkgs,
  ...
}: {
  boot = {
    plymouth = {
      enable = true;
      extraConfig = ''
        ShowDelay=0
        DeviceTimeout=8
      '';
    };

    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = lib.mkForce false;

    loader.limine = {
      enable = true;
      efiSupport = true;
      secureBoot.enable = true;
      maxGenerations = 10;
      enableEditor = false;
      panicOnChecksumMismatch = true;

      style = {
        wallpapers = [../../static/wallpaper.png];
        wallpaperStyle = "stretched";
        backdrop = "091518";

        interface = {
          branding = "fractal desktop";
          brandingColor = "6";
          helpHidden = false;
          resolution = null;
        };

        graphicalTerminal = {
          palette = "334a50;ffb4ab;73daa5;90d5ae;83d3e3;73daa5;90d5ae;d8e5e8";
          brightPalette = "7c959a;ffb4ab;73daa5;90d5ae;83d3e3;73daa5;90d5ae;d8e5e8";

          foreground = "d8e5e8";
          background = "091518";

          brightForeground = "d8e5e8";
          brightBackground = "091518";

          font = {
            scale = null;
            spacing = null;
          };

          margin = null;
          marginGradient = null;
        };
      };
    };

    extraModprobeConfig = ''
      install firewire-core /bin/false
      install firewire_core /bin/false
      install firewire-ohci /bin/false
      install firewire_ohci /bin/false
      install firewire_sbp2 /bin/false
      install firewire-sbp2 /bin/false
      install firewire-net /bin/false
      install thunderbolt /bin/false
      install ohci1394 /bin/false
      install sbp2 /bin/false
      install dv1394 /bin/false
      install raw1394 /bin/false
      install video1394 /bin/false
    '';

    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = [
      "dccp"
      "sctp"
      "rds"
      "tipc"
      "n-hdlc"
      "ax25"
      "netrom"
      "x25"
      "rose"
      "decnet"
      "econet"
      "af_802154"
      "ipx"
      "appletalk"
      "psnap"
      "p8023"
      "p8022"
      "can"
      "atm"
      "cramfs"
      "freevxfs"
      "jffs2"
      "hfs"
      "hfsplus"
      "udf"
      "cifs"
      "nfs"
      "nfsv3"
      "nfsv4"
      "ksmbd"
      "gfs2"
      "vivid"
    ];
    kernelParams = [
      "usbcore.quirks=5566:0008:gki"
      "vt.global_cursor_default=0"
      "quiet"
      "splash"
      "loglevel=3"
      "usbcore.autosuspend=-1"
      "slab_nomerge"
      "init_on_alloc=1"
      "init_on_free=1"
      "page_alloc.shuffle=1"
      "pti=on"
      "randomize_kstack_offset=on"
      "vsyscall=none"
      "debugfs=off"
      "oops=panic"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    kernelModules = [
      "kvm-amd"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];

    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "sdhci_pci"];
      kernelModules = [
        "kvm-amd"
        "nvidia"
        "nvidia_modeset"
        "nvidia_uvm"
        "nvidia_drm"
      ];
    };

    kernel.sysctl = {
      "fs.suid_dumpable" = 0;
      "kernel.kptr_restrict" = 2;
      "kernel.dmesg_restrict" = 1;
      "kernel.unprivileged_bpf_disabled" = 1;
      "dev.tty.ldisc_autoload" = 0;
      "vm.unprivileged_userfaultfd" = 0;
      "kernel.kexec_load_disabled" = 1;
      "kernel.sysrq" = 4;
      "kernel.unprivileged_userns_clone" = 1;
      "kernel.perf_event_paranoid" = 3;
      "net.ipv4.tcp_syncookies" = 1;
      "net.ipv4.tcp_rfc1337" = 1;
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.all.rp_filter" = 1;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
      "vm.mmap_rnd_bits" = 32;
      "vm.mmap_rnd_compat_bits" = 16;
      "fs.protected_symlinks" = 1;
      "fs.protected_hardlinks" = 1;
      "fs.protected_fifos" = 2;
      "fs.protected_regular" = 2;
      "kernel.randomize_va_space" = 2;
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
      "net.ipv4.icmp_echo_ignore_all" = 0;
    };
  };

  hardware.enableRedistributableFirmware = true;
}
