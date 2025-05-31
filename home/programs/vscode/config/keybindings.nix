[
  {
    key = "cmd+h";
    command = "workbench.action.focusLeftGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }
  {
    key = "cmd+left";
    command = "workbench.action.focusLeftGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }
  {
    key = "cmd+l";
    command = "workbench.action.focusRightGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }
  {
    key = "cmd+right";
    command = "workbench.action.focusRightGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }
  {
    key = "cmd+k";
    command = "workbench.action.focusAboveGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }
  {
    key = "cmd+up";
    command = "workbench.action.focusAboveGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }
  {
    key = "cmd+j";
    command = "workbench.action.focusBelowGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }
  {
    key = "cmd+down";
    command = "workbench.action.focusBelowGroup";
    when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
  }

  {
    key = "alt+shift+f";
    command = "editor.action.formatDocument";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "cmd+]";
    command = "editor.action.revealDefinition";
    when = "editorHasDefinitionProvider && editorTextFocus";
  }
  {
    key = "cmd+t";
    command = "workbench.action.navigateBack";
  }

  {
    key = "cmd+j";
    command = "selectNextSuggestion";
    when = "suggestWidgetVisible";
  }
  {
    key = "cmd+k";
    command = "selectPrevSuggestion";
    when = "suggestWidgetVisible";
  }
  {
    key = "cmd+j";
    command = "workbench.action.quickOpenSelectNext";
    when = "inQuickOpen";
  }
  {
    key = "cmd+k";
    command = "workbench.action.quickOpenSelectPrevious";
    when = "inQuickOpen";
  }

  {
    key = "ctrl+shift+f";
    command = "workbench.action.findInFiles";
    when = "editorFocus";
  }

  {
    key = "cmd+shift+e";
    command = "workbench.files.action.focusFilesExplorer";
    when = "editorTextFocus";
  }
  {
    key = "cmd+shift+e";
    command = "workbench.action.focusActiveEditorGroup";
    when = "explorerViewletVisible && filesExplorerFocus";
  }
  {
    key = "cmd+shift+g";
    command = "workbench.view.scm";
    when = "editorTextFocus";
  }
  {
    key = "cmd+enter";
    command = "explorer.openToSide";
    args = {
      group = 0;
    };
    when = "explorerViewletVisible && filesExplorerFocus && !inputFocus";
  }
  {
    key = "ctrl+enter";
    command = "renameFile";
    when = "explorerViewletVisible && filesExplorerFocus";
  }
  {
    key = "enter";
    command = "-renameFile";
    when = "explorerViewletVisible && filesExplorerFocus";
  }
  {
    key = "enter";
    command = "list.select";
    when = "listFocus && !inputFocus";
  }

  {
    key = "cmd+alt+h";
    command = "workbench.action.decreaseViewWidth";
  }
  {
    key = "cmd+alt+left";
    command = "workbench.action.decreaseViewWidth";
  }
  {
    key = "cmd+alt+l";
    command = "workbench.action.increaseViewWidth";
  }
  {
    key = "cmd+alt+right";
    command = "workbench.action.increaseViewWidth";
  }
  {
    key = "ctrl+w m";
    command = "workbench.action.toggleMaximizeEditorGroup";
  }

  {
    key = "alt+[";
    command = "workbench.action.previousEditor";
  }
  {
    key = "alt+]";
    command = "workbench.action.nextEditor";
  }

  {
    key = "ctrl+;";
    command = "workbench.action.terminal.focus";
  }
  {
    key = "ctrl+;";
    command = "workbench.action.focusActiveEditorGroup";
    when = "terminalFocus";
  }
  {
    key = "ctrl+shift+;";
    command = "multiCommand.toggleMaximizedPanelAndFocusTerminal";
    when = "!terminalFocus || terminalFocus";
  }

]
