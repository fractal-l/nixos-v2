{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableScDaemon = false;
    pinentry = {
      package = pkgs.pinentry-gnome3;
      program = "pinentry-gnome3";
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
      ExecStart = "${pkgs.openssh}/bin/ssh-add %h/.ssh/git-signing.ed25519";
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
