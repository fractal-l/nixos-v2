{config, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;

    # NOTE: Resizable BAR must stay DISABLED in UEFI. This board has no
    # Above 4G Decoding option, and with ReBAR on, S3 resume hangs
    # silently (fans spin, no SSH, no signal, zero resume logs, dead
    # even to SysRq). Diagnosed 2026-09 after ruling out s2idle, ASPM
    # retraining and ACPI NVS restore. Cost of disabled ReBAR on desktop
    # is negligible; do not re-enable without retesting sleep cycles.
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  boot.kernelParams = ["nvidia-drm.modeset=1"];
}
