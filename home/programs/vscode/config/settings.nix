{
  pkgs,
  lib,
  config,
  ...
}:
{
  # override font sizes because stylix uses pt instead of px and it gets weird
  "editor.fontSize" = lib.mkForce 14;
  "terminal.integrated.fontSize" = lib.mkForce 14;
  "chat.editor.fontSize" = lib.mkForce 14;
  "debug.console.fontSize" = lib.mkForce 12;
  "markdown.preview.fontSize" = lib.mkForce 12;
  "scm.inputFontSize" = lib.mkForce 12;

  # languages
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = "${pkgs.nixd}/bin/nixd";

  # terminal
  "terminal.integrated.defaultProfile.osx" = "fish";
  "terminal.integrated.profiles.osx" = {
    "fish" = {
      "path" = "${pkgs.fish}/bin/fish";
    };
  };

  # appearence
  "workbench.iconTheme" = "file-icons";

  # general
  "editor.formatOnSave" = true;
  "semanticHighlighting" = true;
  "extensions.ignoreRecommendations" = true;

  # ui
  "window.commandCenter" = false;
  "window.zoomLevel" = 0;
  "workbench.list.smoothScrolling" = true;
  "workbench.layoutControl.enabled" = false;
  "symbols.hidesExplorerArrows" = false;
  "editor.lineHeight" = 1.8;
  "editor.rulers" = [
    88
    120
  ];
  "editor.fontLigatures" = true;
  "editor.minimap.enabled" = false;
  "explorer.compactFolders" = false;
  "editor.renderLineHighlight" = "gutter";
  "workbench.activityBar.location" = "top";
  "editor.scrollBeyondLastLine" = false;
  "editor.cursorSurroundingLines" = 8;
  "workbench.sidebar.location" = "right";

  # suggestions and things which get in my way
  "editor.inlineSuggest.enabled" = true;
  "editor.inlineSuggest.edits.allowCodeShifting" = "never";
  "editor.inlineSuggest.edits.renderSideBySide" = "never";
  "github.copilot.nextEditSuggestions.enabled" = false;

  # languages
  "[python]" = {
    "editor.codeActionsOnSave" = {
      "source.fixAll" = "explicit";
      "source.organizeImports" = "explicit";
    };
    "editor.defaultFormatter" = "charliermarsh.ruff";
  };

  # vim mode
  "vim.easymotion" = true;
  "vim.incsearch" = true;
  "vim.useSystemClipboard" = true;
  "vim.useCtrlKeys" = true;
  "vim.hlsearch" = true;
  "vim.leader" = " ";
  "vim.sneak" = true;
  "vim.foldfix" = true;
  "vim.highlightedyank.enable" = true;
  "vim.highlightedyank.duration" = 200;
  "vim.searchHighlightColor" = "#${config.lib.stylix.colors.base01}";

  "vim.handleKeys" = {
    "<C-d>" = true;
    "<C-u>" = true;
    "<C-f>" = false;
  };

  "vim.insertModeKeyBindings" = [
    {
      before = [
        "j"
        "j"
      ];
      after = [ "<Esc>" ];
    }
  ];

  "vim.normalModeKeyBindingsNonRecursive" = [
    {
      before = [
        "<leader>"
        "d"
      ];
      after = [
        "d"
        "d"
      ];
    }
    {
      # go to cursor
      before = [
        "<leader>"
        "n"
      ];
      commands = [ ":nohl" ];
    }
    {
      before = [ "K" ];
      commands = [ "lineBreakInsert" ];
      silent = true;
    }
    {
      # split editor
      before = [
        "<leader>"
        "x"
      ];
      commands = [ "workbench.action.splitEditor" ];
    }
    {
      before = [
        "<leader>"
        "w"
        "w"
      ];
      commands = [ ":w" ];
    }
    {
      before = [
        "<leader>"
        "w"
        "c"
      ];
      commands = [ "workbench.action.closeActiveEditor" ];
    }
    {
      before = [
        "<leader>"
        "e"
      ];
      commands = [ "workbench.action.toggleSidebarVisibility" ];
    }
    {
      before = [
        "<leader>"
        "f"
      ];
      commands = [ "revealInExplorer" ];
    }
    {
      before = [
        "<leader>"
        "f"
        "y"
      ];
      commands = [ "copyRelativeFilePath" ];
    }
    {
      before = [
        "<leader>"
        "f"
        "n"
      ];
      commands = [ "explorer.newFile" ];
    }
    {
      before = [
        "<leader>"
        "c"
      ];
      commands = [ "editor.action.commentLine" ];
    }
  ];

  "vim.visualModeKeyBindings" = [
    {
      before = [
        "<leader>"
        "c"
      ];
      commands = [
        "editor.action.commentLine"
        "extension.vim_escape"
      ];
    }
    {
      before = [
        "<leader>"
        "a"
      ];
      commands = [ "editor.action.selectHighlights" ];
    }
    {
      before = [
        "<leader>"
        "s"
        "s"
      ];
      commands = [ "editor.action.sortLinesAscending" ];
    }
  ];

  "multiCommand.commands" = [
    {
      command = "multiCommand.toggleMaximizedPanelAndFocusTerminal";
      sequence = [
        "workbench.action.toggleMaximizedPanel"
        "workbench.action.terminal.focus"
      ];
    }
    {
      command = "multiCommand.newTerminalAndFocus";
      sequence = [
        "workbench.action.terminal.new"
        "workbench.action.terminal.focus"
      ];
    }
  ];
}
