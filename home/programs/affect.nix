{
  user,
  ...
}:
{
  imports = [
    ./default.nix
    ./yabai/affect.nix
  ];

  home-manager.users."${user.username}" =
    { pkgs, ... }:
    {
      imports = [
        ./fish/affect.nix
        ./simple-bar/affect.nix
        ./brave/affect.nix
      ];

      home.packages = with pkgs; [
        gh
        ngrok
        lazydocker
        slack
        lazygit
        logseq
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
