{ pkgs, ... }:
{
  services.yabai = {
    enable = true;
    extraConfig =
      let
        yabai = "${pkgs.yabai}/bin/yabai";
      in
      ''
        ${yabai} -m rule --add label="Tuple" app="^Tuple$"  title=".*" manage=off
        ${yabai} -m rule --add label="iPhone Simulator" app="^imulator"  title="iPhone.*" manage=off
        ${yabai} -m rule --add label="DisplayLinkUserAgent" app="^DisplayLinkUserAgent$"  title=".*" manage=off
      '';
  };
}
