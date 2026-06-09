{
  user,
  lib,
  ...
}:
{
  imports = [
    ./default.nix
    ./aerospace/affect.nix
  ];

  home-manager.users."${user.username}" =
    { pkgs, ... }:
    {
      imports = [
        ./fish/affect.nix
        ./brave/affect.nix
      ]
      ++ lib.optionals (user.enableSimpleBar or true) [
        ./simple-bar/affect.nix
      ]
      ++ [
        ./zed/affect.nix
      ];

      home.packages = with pkgs; [
        gh
        ngrok
        lazydocker
        slack
        lazygit

        scrcpy
        android-tools
      ];

      programs = {
        gh = {
          enable = true;
        };
        lazydocker = {
          enable = true;
        };
      };
    };
}
