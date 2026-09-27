{
  lib,
  theme,
  ...
}: {
  programs.zoxide.enable = true;
  programs.starship = {
    enable = true;
    settings = let
      p = theme.palette;
    in {
      palette = theme.name;
      palettes.${theme.name} = {
        text = p.fg;
        muted = p.fg-muted;
        dim = p.fg-dim;
        accent = p.accent;
        red = p.red;
        yellow = p.yellow;
        blue = p.blue;
        purple = p.magenta;
        cyan = p.cyan;
      };

      add_newline = false;
      command_timeout = 1000;

      format = "$username$hostname $directory$git_branch$git_status$nix_shell\n$character";

      username = {
        show_always = true;
        format = "[$user]($style) ";
        style = "bold blue";
      };
      hostname = {
        ssh_only = true;
        format = "[@$hostname]($style) ";
        style = "bold dimmed muted";
      };
      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        home_symbol = "~";
        read_only = " 󰌾";
        format = "[$path]($style)[$read_only]($read_only_style) ";
        style = "bold accent";
      };
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch]($style) ";
        style = "bold purple";
      };
      git_status = {
        format = "([$all_status$ahead_behind]($style)) ";
        style = "bold red";
        conflicted = "=";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
      };
      nix_shell = {
        format = "[󱄅 $name]($style) ";
        style = "bold blue";
      };
      character = {
        success_symbol = "[❯](bold accent)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
  programs.zsh = {
    enable = true;
    autocd = true;

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets"];
    };

    autosuggestion = {
      enable = true;
      strategy = ["match_prev_cmd" "history" "completion"];
    };

    history.append = true;
    historySubstringSearch.enable = true;

    initContent = lib.mkBefore ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      setopt interactive_comments
    '';
  };
}
