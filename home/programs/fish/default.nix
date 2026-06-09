{ pkgs, ... }:
{

  home.packages = with pkgs.fishPlugins; [
    z
    autopair
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      ${pkgs.direnv}/bin/direnv hook fish | source

      export GOPATH="$HOME/go"
      export PATH="$GOPATH/bin:$PATH"
      export PATH="/opt/homebrew/bin:$PATH"

      # Fix plugin conflicts where fish_key_bindings variable is set to empty
      set -e fish_key_bindings
    '';

    plugins = with pkgs.fishPlugins; [
      {
        name = "autopair";
        inherit (autopair) src;
      }
      {
        name = "z";
        inherit (z) src;
      }
    ];
  };
}
