{ lib, ... }:
{
  imports = [
    ./default.nix
    ../home/affect.nix
  ];

  # Menu bar auto-hide exists to make room for simple-bar/ubersicht; not used on this host.
  system.defaults.NSGlobalDomain._HIHideMenuBar = lib.mkForce false;
}
