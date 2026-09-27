{...}: {
  networking = {
    networkmanager.enable = false;
    useNetworkd = true;
    useDHCP = false;

    nameservers = [
      "9.9.9.9"
      "9.9.9.11"
    ];

    interfaces.enp11s0 = {
      wakeOnLan.enable = true;

      ipv4.addresses = [
        {
          address = "192.168.1.2";
          prefixLength = 24;
        }
      ];

      ipv4.routes = [
        {
          address = "0.0.0.0";
          prefixLength = 0;
          via = "192.168.1.1";
        }
      ];
    };

    defaultGateway = {
      address = "192.168.1.1";
      interface = "enp11s0";
    };

    firewall = {
      enable = true;
      allowedUDPPorts = [9];
    };
  };
}
