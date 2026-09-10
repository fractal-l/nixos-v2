{pkgs, ...}: {
  home.packages = with pkgs; [
    devenv
    opencode
    orca-slicer
    nodejs_latest
    bun
  ];
}
