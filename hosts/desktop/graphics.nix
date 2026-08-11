{config, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;

    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  services.xserver.config = ''
    Section "Device"
        Identifier "NVIDIA Card"
        Driver "nvidia"
        Option "Coolbits" "28"
        Option "RegistryDwords" "EnableBrightnessControl=1"
    EndSection
  '';

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  boot.kernelParams = ["nvidia-drm.modeset=1"];
}
