[
  # Pane navigation (vim-like hjkl with alt)
  {
    context = "Workspace";
    bindings = {
      "alt-h" = [ "workspace::ActivatePaneInDirection" "Left" ];
      "alt-j" = [ "workspace::ActivatePaneInDirection" "Down" ];
      "alt-k" = [ "workspace::ActivatePaneInDirection" "Up" ];
      "alt-l" = [ "workspace::ActivatePaneInDirection" "Right" ];
    };
  }

  # Terminal
  {
    context = "Workspace";
    bindings = {
      "ctrl-;" = "workspace::ToggleTerminal";
    };
  }

  # Format document
  {
    context = "Editor";
    bindings = {
      "alt-shift-f" = "editor::Format";
    };
  }

  # Navigate back/forward
  {
    context = "Editor";
    bindings = {
      "alt-[" = "editor::GoBack";
      "alt-]" = "editor::GoForward";
    };
  }

  # Find in files
  {
    context = "Workspace";
    bindings = {
      "ctrl-shift-f" = "workspace::ToggleSearch";
    };
  }

  # File explorer toggle
  {
    context = "Workspace";
    bindings = {
      "cmd-shift-e" = "workspace::ToggleLeftSidebar";
    };
  }

  # Split pane
  {
    context = "Workspace";
    bindings = {
      "cmd-k cmd-left" = [ "workspace::SplitPane" "Left" ];
      "cmd-k cmd-right" = [ "workspace::SplitPane" "Right" ];
      "cmd-k cmd-up" = [ "workspace::SplitPane" "Up" ];
      "cmd-k cmd-down" = [ "workspace::SplitPane" "Down" ];
    };
  }

  # Close active editor
  {
    context = "Editor";
    bindings = {
      "cmd-w" = "pane::CloseActiveItem";
    };
  }

  # Reveal in file explorer
  {
    context = "Editor";
    bindings = {
      "alt-shift-r" = "editor::RevealInFileManager";
    };
  }
]
