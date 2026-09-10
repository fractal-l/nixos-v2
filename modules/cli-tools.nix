{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix

    curl
    wget
    jq
    yq-go

    eza
    bat
    fd
    ripgrep
    fzf
    aria2

    bottom
    btop-cuda
    httpie
    man-pages
    man-pages-posix
    fastfetch
    just
    libqalculate
    codex
  ];
}
