{
  pkgs,
  config,
  simple-bar,
  ...
}:
let
  simpleBarDestinationFolder = "${config.paths.simpleBarFolder}";
in
{
  home.file = {
    "${simpleBarDestinationFolder}".source = simple-bar;
    ".simplebarrc".text = builtins.toJSON (
      import ./config/default.nix {
        inherit pkgs config;
      }
    );
  };
}
