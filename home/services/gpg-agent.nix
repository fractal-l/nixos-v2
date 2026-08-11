{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableScDaemon = false;
    pinentry = {
      package = pkgs.pinentry-gtk2;
      program = "pinentry-gtk-2";
    };

    defaultCacheTtlSsh = 1800;
    maxCacheTtlSsh = 7200;
  };

  systemd.user.services.ssh-add = {
    Unit = {
      Description = "Add SSH keys";
      After = ["graphical-session.target"];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.openssh}/bin/ssh-add %h/.ssh/id_ed25519";
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
