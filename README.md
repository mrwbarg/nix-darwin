# nix-darwin

This is my nix-darwin configuration. Currently it contains settings for both my personal and work mac. For things which have different settings depending on the host, there will be files named `<hostname>.nix` for each host. For other things which are the same across all hosts or are only used in one of the hosts, there is a single `default.nix` file which is imported under the relevant host.

## Private Repository

This configuration uses a private repo to store secrets with `nix-sops`. The secrets are added into this repo through the `private.mkSecrets` function in the `flake.nix` file.

## Programs

There are many different programs managed through this config. Whenever possible, `home-manager` is used to setup applications.
Some of these applications are:

- `yabai` (tiling window manager)
- `skhd` (keyboard shortcuts)
- `stylix` (global unified color theme)
- `fish` + `starship` (shell)
- `zellij` + `zjstatus` (terminal multiplexer)
- `alacritty`
- `vscode` (with vim keybinds)
- `simple-bar` (cool task bar)
- `flameshot` (open source screen shots)

> Yabai requires disabling system integrity protection to work properly!

## Homebrew

Not everything is available in `nixpkgs`. Why not use a package manage for your package manage? Homebrew applications are also configured here. `zap` makes sure that any applications installed manually are purged on rebuild/switch.

## MacOS Settings

Some MacOS settins are also declaratively configured here. Some of it works, some of it is weird.

## Installation & Setup

### Install nix-darwin

```
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

### First Time Build

```
nix run nix-darwin/nix-darwin-<version>#darwin-rebuild --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .#mac
```

#### After First Build

```
sudo darwin-rebuild switch --flake .#<hostname>
```

## Adding a New Host

In the `flake.nix` file, just add another line like `hostname = mkDarwinWorkstation <username> <hostname> <color theme>`

Color themes are base16 color themes available [here](https://tinted-theming.github.io/tinted-gallery/)

## Screenshots

### Macbook Pro (Personal)

![personal-mac](/assets/macbook-pro.png)
