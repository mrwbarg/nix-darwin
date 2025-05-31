{
  pkgs,
  config,
  lib,
  ...
}:
{

  home.file = {
    ".simplebarrc".text = lib.mkForce (
      builtins.toJSON (
        import ./config/default.nix {
          inherit pkgs config lib;
        }
        // import ./config/affect.nix {
          inherit pkgs config lib;
        }
      )
    );
  };
}
