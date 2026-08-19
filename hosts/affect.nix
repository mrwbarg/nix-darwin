{ lib, ... }:
{
  imports = [
    ./default.nix
    ../home/affect.nix
  ];

  system.defaults.dock.autohide = lib.mkForce false;
}
