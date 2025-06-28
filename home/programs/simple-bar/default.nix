{
  pkgs,
  config,
  ...
}:
let
  simpleBarWidget = pkgs.fetchFromGitHub {
    owner = "Jean-Tinland";
    repo = "simple-bar";
    rev = "master";
    sha256 = "sha256-hgjjRDC3yuIshmtcvyqqX06GlxhjOqEz6bW+6myi5mw=";
  };
  simpleBarDestinationFolder = "${config.paths.simpleBarFolder}";
in
{
  home.file = {
    "${simpleBarDestinationFolder}".source = simpleBarWidget;
    ".simplebarrc".text = builtins.toJSON (
      import ./config/default.nix {
        inherit pkgs config;
      }
    );
  };
}
