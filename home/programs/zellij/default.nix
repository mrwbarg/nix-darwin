{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
  };
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      tab {
        pane
      }

      swap_tiled_layout name="vertical" {
            tab max_panes=5 {
            pane split_direction="vertical" {
                pane
                pane { children; }
            }
        }
        tab max_panes=8 {
            pane split_direction="vertical" {
                pane { children; }
                pane { pane; pane; pane; pane; }
            }
        }
        tab max_panes=12 {
            pane split_direction="vertical" {
                pane { children; }
                pane { pane; pane; pane; pane; }
                pane { pane; pane; pane; pane; }
            }
        }
      }

      swap_tiled_layout name="horizontal" {
            tab max_panes=5 {
            pane
            pane
        }
        tab max_panes=8 {
            pane {
                pane split_direction="vertical" { children; }
                pane split_direction="vertical" { pane; pane; pane; pane; }
            }
        }
        tab max_panes=12 {
            pane {
                pane split_direction="vertical" { children; }
                pane split_direction="vertical" { pane; pane; pane; pane; }
                pane split_direction="vertical" { pane; pane; pane; pane; }
            }
        }
      }

      default_tab_template {
        pane size=1 borderless=true {
          plugin location="file://${pkgs.zjstatus}/bin/zjstatus.wasm" {
            format_left " #[fg=${colors.withHashtag.base0D}]#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base01},bold] #[bg=${colors.withHashtag.base02},fg=${colors.withHashtag.base05},bold] {session} {mode} {tabs}"
            format_right "{command_git_branch}"

            mode_normal        "#[bg=${colors.withHashtag.base0B},fg=${colors.withHashtag.base02},bold] NORMAL#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0B}]█"
            mode_locked        "#[bg=${colors.withHashtag.base04},fg=${colors.withHashtag.base02},bold] LOCKED#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base04}]█"
            mode_resize        "#[bg=${colors.withHashtag.base08},fg=${colors.withHashtag.base02},bold] RESIZE#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base08}]█"
            mode_pane          "#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold] PANE#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█"
            mode_tab           "#[bg=${colors.withHashtag.base07},fg=${colors.withHashtag.base02},bold] TAB#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base07}]█"
            mode_scroll        "#[bg=${colors.withHashtag.base0A},fg=${colors.withHashtag.base02},bold] SCROLL#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0A}]█"
            mode_enter_search  "#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold] SEARCH#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█"
            mode_search        "#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold] SEARCHED#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█"
            mode_rename_tab    "#[bg=${colors.withHashtag.base07},fg=${colors.withHashtag.base02},bold] RENAME-TAB#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base07}]█"
            mode_rename_pane   "#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold] RENAME-PANE#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█"
            mode_session       "#[bg=${colors.withHashtag.base0E},fg=${colors.withHashtag.base02},bold] SESSION#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0E}]█"
            mode_move          "#[bg=${colors.withHashtag.base0F},fg=${colors.withHashtag.base02},bold] MOVE#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0F}]█"
            mode_prompt        "#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold] PROMPT#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█"
            mode_tmux          "#[bg=${colors.withHashtag.base09},fg=${colors.withHashtag.base02},bold] TMUX#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base09}]█"

            tab_normal              "#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold]{index} #[bg=${colors.withHashtag.base02},fg=${colors.withHashtag.base05},bold] {name}{floating_indicator}#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base02},bold]█"
            tab_normal_fullscreen   "#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold]{index} #[bg=${colors.withHashtag.base02},fg=${colors.withHashtag.base05},bold] {name}{fullscreen_indicator}#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base02},bold]█"
            tab_normal_sync         "#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base0D}]█#[bg=${colors.withHashtag.base0D},fg=${colors.withHashtag.base02},bold]{index} #[bg=${colors.withHashtag.base02},fg=${colors.withHashtag.base05},bold] {name}{sync_indicator}#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base02},bold]█"

            tab_active              "#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base09}]█#[bg=${colors.withHashtag.base09},fg=${colors.withHashtag.base02},bold]{index} #[bg=${colors.withHashtag.base02},fg=${colors.withHashtag.base05},bold] {name}{floating_indicator}#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base02},bold]█"
            tab_active_fullscreen   "#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base09}]█#[bg=${colors.withHashtag.base09},fg=${colors.withHashtag.base02},bold]{index} #[bg=${colors.withHashtag.base02},fg=${colors.withHashtag.base05},bold] {name}{fullscreen_indicator}#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base02},bold]█"
            tab_active_sync         "#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base09}]█#[bg=${colors.withHashtag.base09},fg=${colors.withHashtag.base02},bold]{index} #[bg=${colors.withHashtag.base02},fg=${colors.withHashtag.base05},bold] {name}{sync_indicator}#[bg=${colors.withHashtag.base03},fg=${colors.withHashtag.base02},bold]█"

            tab_separator           " "

            tab_sync_indicator       " "
            tab_fullscreen_indicator " 󰊓"
            tab_floating_indicator   " 󰹙"
          }
        }
        children
        pane size=1 borderless=true {
          plugin location="zellij:status-bar"
        }
      }
    }
  '';
}
