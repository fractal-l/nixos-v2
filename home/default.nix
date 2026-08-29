{
  inputs,
  system,
  pkgs,
  ...
}: {
  imports = [
    ./wm.nix
    ./cli.nix
    ./apps
    ./services
  ];

  home.username = "kaeeraa";
  home.homeDirectory = "/home/kaeeraa";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  services.gnome-keyring = {
    enable = true;
    components = ["secrets" "pkcs11" "ssh"];
  };

  home.packages = with pkgs; [
    inputs.ayugram-desktop.packages.${system}.default
    inputs.freesmlauncher.packages.${system}.default

    yandex-music

    maple-mono.Normal-NF
    nerd-fonts.iosevka
    inter

    devenv
    element-desktop
    opencode

    orca-slicer

    nodejs_latest
    bun
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "alacritty";
  };
}
