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
      "ctrl-;" = "terminal_panel::ToggleFocus";
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
      "alt-[" = "pane::GoBack";
      "alt-]" = "pane::GoForward";
    };
  }

  # Find in files
  {
    context = "Workspace";
    bindings = {
      "ctrl-shift-f" = "project_search::ToggleFocus";
    };
  }

  # File explorer toggle
  {
    context = "Workspace";
    bindings = {
      "cmd-shift-e" = "project_panel::ToggleFocus";
    };
  }

  # Split pane
  {
    context = "Workspace";
    bindings = {
      "cmd-k cmd-h" = "pane::SplitLeft";
      "cmd-k cmd-l" = "pane::SplitRight";
      "cmd-k cmd-k" = "pane::SplitUp";
      "cmd-k cmd-j" = "pane::SplitDown";
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

  # Agent/assistant panel
  {
    context = "Workspace";
    bindings = {
      "cmd-shift-a" = "assistant::ToggleFocus";
    };
  }

  # Version control / git panel
  {
    context = "Workspace";
    bindings = {
      "cmd-k cmd-g" = "git_panel::ToggleFocus";
    };
  }

  # Copy relative file path
  {
    context = "Editor";
    bindings = {
      "cmd-k cmd-f" = "editor::CopyPath";
    };
  }
]
