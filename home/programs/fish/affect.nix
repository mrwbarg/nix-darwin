{ config, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      export PATH="/opt/aptible-toolbelt/bin:$PATH"
      export PATH="$HOME/.docker/bin:$PATH"
      export GH_TOKEN=(cat ${config.sops.secrets.gh-cli-token.path})
    '';
  };
}
