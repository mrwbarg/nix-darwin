{ pkgs, lib, ... }:
let
  emailUtils = import ../../../lib/email-utils.nix { inherit lib; };
  email = emailUtils.deobfuscateEmail "mrwbarg--AT--gmail--DOT--com";
in
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Mauricio Barg";
        email = "${email}";
      };

      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        lg = "log --oneline --graph --decorate";
      };

      core.editor = "${pkgs.neovim}/bin/nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };

  };
}
