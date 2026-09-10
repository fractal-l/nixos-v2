{
  inputs,
  system,
  pkgs,
  ...
}: {
  imports = [
    ./profiles/desktop.nix
  ];

  home.username = "kaeeraa";
  home.homeDirectory = "/home/kaeeraa";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  services.gnome-keyring = {
    enable = true;
    components = ["secrets" "pkcs11" "ssh"];
  };
}
