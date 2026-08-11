{pkgs, lib, config, ...}: {
  security.sudo.enable = false;

  security.run0 = {
    enable = true;
    enableSudoAlias = true;
    wheelNeedsPassword = false;
  };

  security.doas = {
    enable = true;
    extraRules = [
      {
        users = ["kaeeraa"];
        keepEnv = true;
        noPass = true;
      }
    ];
  };

  systemd.coredump.enable = false;
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "-";
      item = "core";
      value = "0";
    }
  ];

  security.wrappers.input-remapper-gtk = lib.mkIf config.services.input-remapper.enable {
    source = "${pkgs.input-remapper}/bin/input-remapper-gtk";
    owner = "root";
    group = "root";
    setuid = true;
  };
}
