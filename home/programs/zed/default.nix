{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "docker"
      "ruff"
      "opencode"
      "copilot"
    ];
    extraPackages = with pkgs; [
      nixd
      nil
      ruff
      biome
      go
    ];
    userSettings = {
      vim_mode = true;
      relative_line_numbers = true;

      # stylix handles fonts and theme, but we force px sizes
      ui_font_size = lib.mkForce 14;
      buffer_font_size = lib.mkForce 14;

      format_on_save = "on";
      show_whitespaces = "selection";
      soft_wrap = "none";
      gutter = {
        line_numbers = true;
        code_actions = false;
        rulers = [
          88
          120
        ];
      };
      assistant = {
        enabled = true;
        version = "2";
      };
      features = {
        copilot = true;
        inline_completion_provider = "copilot";
      };
      terminal = {
        shell = {
          program = "fish";
        };
        alternate_scroll = "off";
        blinking = "off";
      };
      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
          settings = {
            nixd = {
              enable = true;
            };
          };
        };
      };
      file_scan_exclusions = [
        ".git"
        ".direnv"
        "node_modules"
        "vendor"
        "result"
      ];
      project_panel = {
        file_icons = true;
        folder_icons = true;
      };
      toolbar = {
        breadcrumbs = true;
        quick_actions = false;
      };
      tabs = {
        close_position = "right";
        file_icons = true;
        git_status = true;
      };
    };
    userKeymaps = import ./config/keybindings.nix;
  };
}
