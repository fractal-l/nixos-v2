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

  home.username = "fractal";
  home.homeDirectory = "/home/fractal";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  services.gnome-keyring = {
    enable = true;
    components = ["secrets" "pkcs11" "ssh"];
  };

  home.packages = with pkgs; [
    inputs.ayugram-desktop.packages.${system}.default
    inputs.freesmlauncher.packages.${system}.default
    inputs.nix-gaming.packages.${system}.rocket-league

    yandex-music
    obsidian
    postman

    maple-mono.Normal-NF
    nerd-fonts.iosevka
    inter

    gpu-screen-recorder
    devenv
    element-desktop
    gwe
    opencode
    opencode-desktop

    bitwarden-cli
    keyguard

    nodejs_latest
    bun
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "alacritty";
  };
}
