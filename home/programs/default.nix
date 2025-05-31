{
  user,
  pkgs,
  ...
}:
{
  imports = [
    ./yabai
    ./skhd
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
        ./simple-bar
        ./stylix
        ./ssh
        ./git
        ./vscode
        ./languages
        ./brave
        ./flameshot
        ./thunderbird
      ];

      home.packages = with pkgs; [
        alacritty
        btop
        direnv
        fish
        jq
        xplr
        zellij
        zjstatus
        bruno
        maccy
        thunderbird
        neofetch
      ];

      programs = {
        btop = {
          enable = true;
        };
        direnv = {
          enable = true;
          silent = true;
        };
        neovim = {
          enable = true;
        };

      };
    };

}
