{
  lib,
  pkgs,
  theme,
  ...
}: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = pkgs.nix4vscode.forVscode [
        "jnoortheen.nix-ide"
        "ms-python.python"
        "ms-python.vscode-pylance"
        "mads-hartmann.bash-ide-vscode"
        "esbenp.prettier-vscode"

        "editorconfig.editorconfig"
        "foxundermoon.shell-format"
        "mkhl.direnv"
        "kamadorueda.alejandra"

        "rust-lang.rust-analyzer"
        "tamasfe.even-better-toml"
        "charliermarsh.ruff"
        "usernamehw.errorlens"
        "christian-kohler.path-intellisense"
        "yzhang.markdown-all-in-one"

        "ms-vscode.cmake-tools"
        "ms-vscode.cpptools"

        "ms-vscode.remote-explorer"
        "ms-vscode-remote.remote-ssh"
        "ms-vscode-remote.remote-ssh-edit"

        "llvm-vs-code-extensions.vscode-clangd"
        "ms-vscode.cpptools-extension-pack"

        "github.vscode-github-actions"
        "nefrob.vscode-just-syntax"

        "vscjava.vscode-java-pack"
        "mathiasfrohlich.kotlin"

        "dbaeumer.vscode-eslint"
        "christian-kohler.npm-intellisense"
        "aaron-bond.better-comments"
        "datakurre.devenv"
        "platformio.platformio-ide"

        "inferrinizzard.prettier-sql-vscode"
      ];
      userSettings = {
        "window.zoomLevel" = 0;
        "workbench.colorTheme" = "Default Dark Modern";
        "workbench.startupEditor" = "none";
        "window.titleBarStyle" = "custom";
        "window.commandCenter" = false;

        "editor.fontFamily" = theme.fonts.mono;
        "editor.fontSize" = lib.mkForce 16;
        "editor.lineHeight" = 1.2;
        "editor.fontWeight" = 500;
        "editor.fontLigatures" = true;
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.minimap.enabled" = true;
        "editor.wordWrap" = "bounded";
        "editor.wrapOnEscapedLineFeeds" = true;
        "editor.wrappingStrategy" = "advanced";
        "editor.wordWrapColumn" = 140;
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 500;
        "editor.cursorBlinking" = "phase";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.accessibilitySupport" = "off";
        "editor.renderWhitespace" = "selection";
        "editor.suggest.preview" = true;
        "editor.minimap.autohide" = "mouseover";
        "editor.smoothScrolling" = true;
        "terminal.integrated.smoothScrolling" = true;
        "files.eol" = "\n";

        "cmake.configureOnOpen" = true;
        "cmake.buildDirectory" = "\${workspaceFolder}/build";
        "cmake.generator" = "Ninja";
        "cmake.exportCompileCommandsFile" = true;
        "clangd.arguments" = [
          "--compile-commands-dir=\${workspaceFolder}/build"
          "--background-index"
          "--clang-tidy"
          "--completion-style=detailed"
        ];
        "C_Cpp.intelliSenseEngine" = "disabled";

        "chat.disableAIFeatures" = true;
        "terminal.integrated.profiles.linux" = {
          zsh = {
            path = "${pkgs.zsh}/bin/zsh";
          };
        };
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "platformio-ide.useBuiltinPIOCore" = false;

        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        "git.alwaysSignOff" = true;
        "git.autoStash" = true;
        "git.enableCommitSigning" = true;
        "git.ignoreSubmodules" = true;
        "git.rebaseWhenSync" = true;
        "github.gitProtocol" = "ssh";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "alejandra";

        "python.analysis.languageServerMode" = "full";
        "python.analysis.typeCheckingMode" = "standard";
        "python.analysis.diagnosticMode" = "workspace";
        "python.analysis.fixAll" = [
          "source.unusedImports"
          "source.convertImportFormat"
          "source.convertImportStar"
          "source.addTypeAnnotation"
        ];

        "bashIde.shfmt.simplifyCode" = true;
        "shellformat.path" = "${pkgs.shfmt}/bin/shfmt";

        "telemetry.telemetryLevel" = "off";
        "extensions.autoUpdate" = "off";
        "update.mode" = "none";
        "workbench.enableExperiments" = false;
        "security.workspace.trust.enabled" = false;
        "breadcrumbs.enabled" = true;
        "explorer.compactFolders" = false;
        "workbench.list.smoothScrolling" = true;
        "keyboard.dispatch" = "keyCode";

        # -- theme: workbench chrome --
        "workbench.colorCustomizations" = {
          "focusBorder" = theme.palette.accent;
          "border" = theme.palette.border;
          "widget.shadow" = "#00000066";

          "editor.background" = theme.palette.bg;
          "editor.foreground" = theme.palette.fg;
          "editor.lineHighlightBackground" = theme.palette.surface;
          "editorLineNumber.foreground" = theme.palette.fg-dim;
          "editorLineNumber.activeForeground" = theme.palette.fg-muted;
          "editorCursor.foreground" = theme.palette.accent;
          "editor.selectionBackground" = "${theme.palette.accent}55";
          "editor.selectionHighlightBackground" = "${theme.palette.border}88";
          "editorIndentGuide.background" = theme.palette.border;
          "editorGroup.border" = theme.palette.border;
          "editorGroupHeader.tabsBackground" = theme.palette.surface;
          "editorWidget.background" = theme.palette.overlay;
          "editorWidget.border" = theme.palette.border;
          "editorSuggestWidget.background" = theme.palette.overlay;
          "editorSuggestWidget.selectedBackground" = theme.palette.border;
          "editorHoverWidget.background" = theme.palette.overlay;

          "editorGutter.addedBackground" = theme.palette.accent;
          "editorGutter.modifiedBackground" = theme.palette.yellow;
          "editorGutter.deletedBackground" = theme.palette.red;
          "editorError.foreground" = theme.palette.red;
          "editorWarning.foreground" = theme.palette.yellow;
          "editorInfo.foreground" = theme.palette.blue;

          "sideBar.background" = theme.palette.surface;
          "sideBar.border" = theme.palette.border;
          "activityBar.background" = theme.palette.surface;
          "activityBar.border" = theme.palette.border;
          "activityBar.foreground" = theme.palette.fg;
          "activityBar.inactiveForeground" = theme.palette.fg-dim;
          "titleBar.activeBackground" = theme.palette.surface;
          "statusBar.background" = theme.palette.surface;
          "statusBar.border" = theme.palette.border;
          "statusBar.foreground" = theme.palette.fg-muted;
          "panel.background" = theme.palette.surface;
          "panel.border" = theme.palette.border;

          "tab.activeBackground" = theme.palette.bg;
          "tab.inactiveBackground" = theme.palette.surface;
          "tab.border" = theme.palette.border;
          "tab.activeBorderTop" = theme.palette.accent;

          "list.activeSelectionBackground" = theme.palette.border-hi;
          "list.activeSelectionForeground" = theme.palette.fg;
          "list.inactiveSelectionBackground" = theme.palette.border;
          "list.hoverBackground" = theme.palette.border;
          "list.focusOutline" = theme.palette.accent;

          "input.background" = theme.palette.bg;
          "input.border" = theme.palette.border;
          "inputValidation.errorBorder" = theme.palette.red;
          "inputValidation.warningBorder" = theme.palette.yellow;
          "inputValidation.infoBorder" = theme.palette.blue;
          "dropdown.background" = theme.palette.overlay;
          "dropdown.border" = theme.palette.border;
          "menu.background" = theme.palette.overlay;
          "menu.border" = theme.palette.border;
          "menu.selectionBackground" = theme.palette.border-hi;
          "notification.background" = theme.palette.overlay;
          "notification.border" = theme.palette.border;

          "badge.background" = theme.palette.border-hi;
          "badge.foreground" = theme.palette.fg;
          "button.background" = theme.palette.accent;
          "button.foreground" = theme.palette.bg;
          "button.hoverBackground" = theme.palette.accent-dim;
          "button.secondaryBackground" = theme.palette.border-hi;
          "button.secondaryForeground" = theme.palette.fg;
          "progressBar.background" = theme.palette.accent;
          "scrollbarSlider.background" = "${theme.palette.border-hi}88";
          "scrollbarSlider.hoverBackground" = "${theme.palette.border-hi}aa";
          "scrollbarSlider.activeBackground" = theme.palette.accent;

          "gitDecoration.addedResourceForeground" = theme.palette.accent;
          "gitDecoration.modifiedResourceForeground" = theme.palette.yellow;
          "gitDecoration.deletedResourceForeground" = theme.palette.red;
          "gitDecoration.untrackedResourceForeground" = theme.palette.blue;
          "gitDecoration.ignoredResourceForeground" = theme.palette.fg-dim;

          "terminal.foreground" = theme.palette.fg;
          "terminal.selectionBackground" = "${theme.palette.accent}55";
          "terminalCursor.foreground" = theme.palette.accent;
          "terminal.ansiBlack" = theme.ansi.normal.black;
          "terminal.ansiRed" = theme.ansi.normal.red;
          "terminal.ansiGreen" = theme.ansi.normal.green;
          "terminal.ansiYellow" = theme.ansi.normal.yellow;
          "terminal.ansiBlue" = theme.ansi.normal.blue;
          "terminal.ansiMagenta" = theme.ansi.normal.magenta;
          "terminal.ansiCyan" = theme.ansi.normal.cyan;
          "terminal.ansiWhite" = theme.ansi.normal.white;
          "terminal.ansiBrightBlack" = theme.ansi.bright.black;
          "terminal.ansiBrightRed" = theme.ansi.bright.red;
          "terminal.ansiBrightGreen" = theme.ansi.bright.green;
          "terminal.ansiBrightYellow" = theme.ansi.bright.yellow;
          "terminal.ansiBrightBlue" = theme.ansi.bright.blue;
          "terminal.ansiBrightMagenta" = theme.ansi.bright.magenta;
          "terminal.ansiBrightCyan" = theme.ansi.bright.cyan;
          "terminal.ansiBrightWhite" = theme.ansi.bright.white;
        };

        # -- theme: syntax --
        "editor.tokenColorCustomizations" = {
          textMateRules = [
            {
              scope = "comment";
              settings = {
                foreground = theme.palette.fg-dim;
                fontStyle = "italic";
              };
            }
            {
              scope = ["string" "string.quoted" "constant.character"];
              settings.foreground = theme.palette.accent;
            }
            {
              scope = ["keyword" "storage" "variable.language"];
              settings.foreground = theme.palette.blue;
            }
            {
              scope = ["constant.numeric" "constant.language"];
              settings.foreground = theme.palette.yellow;
            }
            {
              scope = ["entity.name.type" "support.type" "entity.name.class"];
              settings.foreground = theme.palette.orange;
            }
            {
              scope = ["entity.name.function" "support.function" "meta.function-call"];
              settings.foreground = theme.palette.fg;
            }
            {
              scope = ["variable" "meta.variable"];
              settings.foreground = theme.palette.fg;
            }
          ];
        };

        "eslint.lintTask.enable" = true;
        "eslint.format.enable" = true;

        "files.exclude" = {
          "**/node_modules" = true;
          "**/.git" = true;
          "**/dist" = true;
          "**/.devenv" = true;
          "**/*.lock" = true;
        };

        "[nix]"."editor.defaultFormatter" = "kamadorueda.alejandra";
        "[toml]"."editor.defaultFormatter" = "tamasfe.even-better-toml";
        "[shellscript]"."editor.defaultFormatter" = "foxundermoon.shell-format";
        "[gitignore]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[python]"."editor.defaultFormatter" = "charliermarsh.ruff";
        "[rust]"."editor.defaultFormatter" = "rust-lang.rust-analyzer";
        "[cpp]"."editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
        "[just]"."editor.defaultFormatter" = "nefrob.vscode-just-syntax";
        "[sql]"."editor.defaultFormatter" = "inferrinizzard.prettier-sql-vscode";
        "[javascript]"."editor.defaultFormatter" = "dbaeumer.vscode-eslint";
        "[typescript]"."editor.defaultFormatter" = "dbaeumer.vscode-eslint";
      };

      keybindings = [
        {
          key = "ctrl+h";
          command = "workbench.action.navigateLeft";
        }
        {
          key = "ctrl+j";
          command = "workbench.action.navigateDown";
        }
        {
          key = "ctrl+k";
          command = "workbench.action.navigateUp";
        }
        {
          key = "ctrl+l";
          command = "workbench.action.navigateRight";
        }

        {
          key = "ctrl+shift+[";
          command = "workbench.action.previousEditor";
        }
        {
          key = "ctrl+shift+]";
          command = "workbench.action.nextEditor";
        }

        {
          key = "ctrl+p";
          command = "workbench.action.quickOpen";
        }
        {
          key = "ctrl+shift+p";
          command = "workbench.action.showCommands";
        }
        {
          key = "ctrl+shift+f";
          command = "workbench.action.findInFiles";
        }

        {
          key = "f12";
          command = "editor.action.revealDefinition";
        }
        {
          key = "shift+f12";
          command = "editor.action.goToReferences";
        }
        {
          key = "ctrl+k ctrl+i";
          command = "editor.action.showHover";
        }
        {
          key = "ctrl+.";
          command = "editor.action.codeAction";
        }

        {
          key = "ctrl+`";
          command = "workbench.action.terminal.toggleTerminal";
        }
        {
          key = "ctrl+shift+`";
          command = "workbench.action.terminal.new";
        }

        {
          key = "ctrl+shift+i";
          command = "editor.action.formatDocument";
        }

        {
          key = "ctrl+/";
          command = "editor.action.commentLine";
          when = "editorTextFocus";
        }
      ];

      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
    };
  };

  home.packages = with pkgs; [
    platformio
    avrdude
    cmake
    ninja
    gdb
    clang
    llvmPackages.clang-tools
    just-lsp
    just-formatter
    alejandra
    shfmt
    nixd
  ];
}
