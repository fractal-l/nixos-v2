{pkgs, ...}: {
  programs.zsh.enable = true;

  environment.shellAliases = {
    ls = "eza --icons --group-directories-first";
    ll = "eza -lah --icons --group-directories-first";
    lt = "eza --tree --icons";
    cat = "bat -p";
    grep = "rg";
    find = "fd";
    j = "just";
    ff = "fastfetch";
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };
}
