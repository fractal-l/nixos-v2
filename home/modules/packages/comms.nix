{inputs, pkgs, system, ...}: {
  home.packages = with pkgs; [
    inputs.ayugram-desktop.packages.${system}.default
    inputs.freesmlauncher.packages.${system}.default
    yandex-music
    element-desktop
  ];
}
