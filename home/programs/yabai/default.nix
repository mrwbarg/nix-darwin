{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  environment.systemPackages = with pkgs; [
    yabai
  ];

  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      external_bar = "all:35:0";
      layout = "bsp";
      auto_balance = "off";
      split_ratio = 0.5;

      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      focus_follows_mouse = "autofocus";

      # gaps
      top_padding = 5;
      bottom_padding = 5;
      left_padding = 5;
      right_padding = 5;
      window_gap = 5;

      window_border = "on";
      window_border_blur = "off";
      window_border_width = 8;

      widow_shadow = "float";

      insert_feedback_color = "0xFF${colors.base0B}";
    };

    extraConfig =
      let
        yabai = "${pkgs.yabai}/bin/yabai";
        skhd = "${pkgs.skhd}/bin/skhd";
      in
      ''
        ${skhd} --reload

        ${yabai} -m rule --add label="System Settings" app="^System Settings$"  title=".*" manage=off
        ${yabai} -m rule --add label="Calculator" app="^Calculator"  title=".*" manage=off
        ${yabai} -m rule --add label="App Store" app="^App Store$"  title=".*" manage=off
        ${yabai} -m rule --add label="Activity Monitor" app="^Activity Monitor$"  title=".*" manage=off
        ${yabai} -m rule --add label="Software Update" app="^Software Update$"  title=".*" manage=off

        ${yabai} -m signal --add event=dock_did_restart action="sudo ${yabai} --load-sa"
      '';
  };
}
