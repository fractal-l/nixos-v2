{
  imports = [
    ../modules/boot.nix
    ../modules/zsh.nix
    ../modules/starship.nix
    ../modules/cli-tools.nix
    ../modules/locale.nix
    ../modules/package-manager.nix
    ../modules/users.nix
    ../modules/hardening.nix
    ../modules/openssh.nix
    ../modules/tpm.nix
    ../modules/virtualisation.nix
    ../modules/impermanence.nix
    ../modules/overlays.nix
  ];

  programs.mango.enable = true;
  programs.nix-index-database.comma.enable = true;
}
