{...}: {
  # docker tries to start from 'greeter' user
  systemd.user.services.docker.serviceConfig.ConditionUser = "kaeeraa";

  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    containerd.enable = true;
  };
}
