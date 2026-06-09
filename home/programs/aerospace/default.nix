{ pkgs, user, ... }:
let
  enableSimpleBar = user.enableSimpleBar or true;
in
{
  environment.systemPackages = with pkgs; [ aerospace ];

  services.aerospace = {
    enable = true;
    settings = {
      enable-normalization-flatten-containers = false;
      enable-normalization-opposite-orientation-for-nested-containers = false;

      accordion-padding = 30;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      gaps = {
        inner = {
          horizontal = 5;
          vertical = 5;
        };
        outer = {
          left = 5;
          bottom = 5;
          right = 5;
          top = if enableSimpleBar then 35 else 10;
        };
      };

      on-window-detected = [
        {
          "if" = {
            "app-id" = "com.apple.systempreferences";
          };
          run = "layout floating";
        }
        {
          "if" = {
            "app-id" = "com.apple.calculator";
          };
          run = "layout floating";
        }
        {
          "if" = {
            "app-id" = "com.apple.appstore";
          };
          run = "layout floating";
        }
        {
          "if" = {
            "app-id" = "com.apple.ActivityMonitor";
          };
          run = "layout floating";
        }
      ];

      # Refresh simple-bar on workspace/focus changes
      on-focus-changed = [
        "exec-and-forget osascript -e 'tell application id \"tracesOf.Uebersicht\" to refresh widget id \"simple-bar-index-jsx\"'"
      ];

      exec-on-workspace-change = [
        "exec-and-forget osascript -e 'tell application id \"tracesOf.Uebersicht\" to refresh widget id \"simple-bar-index-jsx\"'"
      ];

      mode.main.binding = {
        # Window focus
        "alt-h" = "focus left";
        "alt-j" = "focus down";
        "alt-k" = "focus up";
        "alt-l" = "focus right";

        # Window move
        "alt-shift-h" = "move left";
        "alt-shift-j" = "move down";
        "alt-shift-k" = "move up";
        "alt-shift-l" = "move right";

        # Resize
        "alt-ctrl-h" = "resize width -60";
        "alt-ctrl-j" = "resize height +60";
        "alt-ctrl-k" = "resize height -60";
        "alt-ctrl-l" = "resize width +60";

        # Workspace switching
        "alt-1" = "workspace 1";
        "alt-2" = "workspace 2";
        "alt-3" = "workspace 3";
        "alt-4" = "workspace 4";
        "alt-5" = "workspace 5";
        "alt-6" = "workspace 6";
        "alt-7" = "workspace 7";
        "alt-8" = "workspace 8";
        "alt-9" = "workspace 9";

        "alt-tab" = "workspace-back-and-forth";

        # Scroll workspaces
        "ctrl-h" = "workspace prev";
        "ctrl-left" = "workspace prev";
        "ctrl-l" = "workspace next";
        "ctrl-right" = "workspace next";

        # Move window to workspace
        "alt-shift-1" = "move-node-to-workspace 1";
        "alt-shift-2" = "move-node-to-workspace 2";
        "alt-shift-3" = "move-node-to-workspace 3";
        "alt-shift-4" = "move-node-to-workspace 4";
        "alt-shift-5" = "move-node-to-workspace 5";
        "alt-shift-6" = "move-node-to-workspace 6";
        "alt-shift-7" = "move-node-to-workspace 7";
        "alt-shift-8" = "move-node-to-workspace 8";
        "alt-shift-9" = "move-node-to-workspace 9";

        # Monitor focus
        "alt-d" = "focus-monitor right";
        "alt-a" = "focus-monitor left";

        # Move workspace to monitor
        "alt-shift-d" = "move-workspace-to-monitor --wrap-around next";
        "alt-shift-a" = "move-workspace-to-monitor --wrap-around prev";

        # Layout toggling
        "alt-shift-z" = "layout tiles";
        "alt-shift-x" = "layout accordion";

        # Window operations
        "alt-f" = "fullscreen";
        "alt-w" = "close";
        "alt-shift-enter" = "fullscreen";

        # Reload config
        "alt-ctrl-r" = "reload-config";
      };
    };
  };
}
