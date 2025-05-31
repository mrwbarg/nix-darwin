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
