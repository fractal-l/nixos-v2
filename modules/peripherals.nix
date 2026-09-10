{pkgs, ...}: {
  services.udev = {
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
      ACTION=="add", SUBSYSTEM=="usb", TEST=="power/wakeup", ATTR{power/wakeup}="disabled"
    '';
    packages = with pkgs; [
      platformio-core.udev
      openocd
    ];
  };
  services.input-remapper = {
    enable = true;
    serviceWantedBy = ["multi-user.target"];
    enableUdevRules = true;
  };
}
