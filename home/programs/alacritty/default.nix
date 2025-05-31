{ pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      general = {
        live_config_reload = true;
      };
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = [
            "-c"
            "zellij options --default-shell fish"
          ];
        };
      };
      window = {
        startup_mode = "Windowed";
        decorations = "Buttonless";
        decorations_theme_variant = "Dark";
        dimensions = {
          columns = 0;
          lines = 0;
        };
        opacity = lib.mkForce 0.90;
        blur = true;
        option_as_alt = "Both";
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };
}
