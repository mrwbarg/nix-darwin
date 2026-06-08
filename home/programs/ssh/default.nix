{ config, ... }:
let
  sshKeyPath = "${config.home.homeDirectory}/.ssh/id_ed25519";
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings."github.com" = {
      User = "git";
      IdentityFile = sshKeyPath;
      AddKeysToAgent = "yes";
    };
  };
}
