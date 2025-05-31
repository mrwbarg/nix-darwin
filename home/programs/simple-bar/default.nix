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
    sha256 = "sha256-r1Efp+VZKTerUFFVCDU7aa9kbKogbFm0D1pn2CnIYVU=";
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
