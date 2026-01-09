{ config, ... }:
let
  sshKeyPath = "${config.home.homeDirectory}/.ssh/id_ed25519";
in
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = sshKeyPath;
        addKeysToAgent = "yes";
      };
    };
  };
}
