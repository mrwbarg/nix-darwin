{
  user,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./default.nix
    ./aerospace/affect.nix
  ];

  launchd.user.agents.affect-toolbar = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.nix}/bin/nix"
        "run"
        "git+ssh://git@github.com/affect-therapeutics/toolbar"
        "--refresh"
      ];
      RunAtLoad = true;
      StandardOutPath = "${user.homeDirectory}/Library/Logs/affect-toolbar.log";
      StandardErrorPath = "${user.homeDirectory}/Library/Logs/affect-toolbar.log";
    };
  };

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
