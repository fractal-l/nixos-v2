{pkgs, ...}: {
  imports = [
    ../../profiles/base.nix
    ../../profiles/desktop.nix
    ./secrets
    ./hardware.nix
  ];
  networking.hostName = "desktop";
  system.stateVersion = "26.05";
}
