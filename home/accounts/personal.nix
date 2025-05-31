{ lib, ... }:
let
  emailUtils = import ../../lib/email-utils.nix { inherit lib; };
  email = emailUtils.deobfuscateEmail "mrwbarg--AT--gmail--DOT--com";
in
{
  accounts.email.accounts = {
    Personal = {
      address = "${email}";
      realName = "Mauricio Barg";
      userName = "${email}";
      flavor = "gmail.com";
      primary = true;
      thunderbird.enable = true;
    };
  };
}
