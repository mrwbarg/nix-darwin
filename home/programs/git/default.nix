{ pkgs, lib, ... }:
let
  emailUtils = import ../../../lib/email-utils.nix { inherit lib; };
  email = emailUtils.deobfuscateEmail "mrwbarg--AT--gmail--DOT--com";
in
{
  programs.git = {
    enable = true;

    userName = "Mauricio Barg";
    userEmail = "${email}";

    extraConfig = {
      core.editor = "${pkgs.neovim}/bin/nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      lg = "log --oneline --graph --decorate";
    };
  };
}
