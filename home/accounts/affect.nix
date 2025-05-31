{ lib, ... }:
let
  emailUtils = import ../../lib/email-utils.nix { inherit lib; };
  email = emailUtils.deobfuscateEmail "mauricio--DOT--barg--AT--affecttherapeutics--DOT--com";
in
{
  accounts.email.accounts = {
    Affect = {
      address = "${email}";
      realName = "Mauricio Barg";
      userName = "${email}";
      flavor = "gmail.com";
      primary = true;
      thunderbird.enable = true;
    };
  };
}
