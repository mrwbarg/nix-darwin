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
    sha256 = "sha256-8MpANF0m/c8Z2btgArn1pavxoP2qdkKX4dD9l3nDFa8=";
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
