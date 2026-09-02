{
  user,
  pkgs,
  lib,
  ...
}:
let
  enableSimpleBar = user.enableSimpleBar or true;
in
{
  imports = [
    ./aerospace
  ];

  # enable stylix outside of home-manager so we can use colors in other apps
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${user.theme}.yaml";
  stylix.enable = true;

  home-manager.users."${user.username}" =
    { pkgs, ... }:

    {
      imports = [
        ./zellij
        ./alacritty
        ./fish
        ./starship
        ./stylix
        ./ssh
        ./git
        ./vscode
        ./zed
        ./languages
        ./brave
        ./thunderbird
      ]
      ++ lib.optionals enableSimpleBar [
        ./simple-bar
      ];

      home.packages = with pkgs; [
        alacritty
        btop
        direnv
        fish
        opencode
        jq
        xplr
        zellij
        zjstatus
        bruno
        maccy
        # thunderbird
        fastfetch
        biome
      ];

      programs = {
        man = {
          generateCaches = false;
        };
        btop = {
          enable = true;
        };
        direnv = {
          enable = true;
          silent = true;
        };
        neovim = {
          enable = true;
          plugins = with pkgs.vimPlugins; [
            mini-nvim
          ];
        };

      };
    };

}
