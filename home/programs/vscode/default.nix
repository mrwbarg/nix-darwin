{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    package = import ./extras/overlay.nix {
      inherit pkgs config;
    };
    profiles.default = {
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      extensions =
        with pkgs.vscode-extensions;
        [
          file-icons.file-icons
          usernamehw.errorlens
          github.copilot

          # languages
          jnoortheen.nix-ide
          esbenp.prettier-vscode
          ms-python.python
          ms-python.vscode-pylance
          charliermarsh.ruff
          golang.go
          dbaeumer.vscode-eslint

          # general
          vscodevim.vim
          eamodio.gitlens
          aaron-bond.better-comments
        ]
        ++ [
          (pkgs.vscode-utils.extensionFromVscodeMarketplace {
            name = "multi-command";
            version = "1.6.0";
            publisher = "ryuta46";
            sha256 = "sha256-AnHN1wvyVrZRlnOgxBK7xKLcL7SlAEKDcw6lEf+2J2E=";
          })
          (pkgs.vscode-utils.extensionFromVscodeMarketplace {
            name = "KDL";
            version = "2.1.3";
            publisher = "kdl-org";
            sha256 = "sha256-Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM=";
          })
        ];
      userSettings = import ./config/settings.nix {
        inherit pkgs config lib;
      };
      keybindings = import ./config/keybindings.nix;
    };
  };
}
