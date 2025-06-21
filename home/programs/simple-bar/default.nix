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
    sha256 = "sha256-gtUfAG8uaX6DWQslF0YE3g14fS4SkmTIuHPZSqLX3XQ=";
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
