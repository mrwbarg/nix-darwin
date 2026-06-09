{
  description = "mrwbarg's NixOS and macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zjstatus = {
      url = "github:dj95/zjstatus";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
    simple-bar = {
      url = "github:Jean-Tinland/simple-bar";
      flake = false;
    };
    private = {
      url = "git+ssh://git@github.com/mrwbarg/nix-private";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nix-darwin,
      nixpkgs,
      stylix,
      zjstatus,
      mac-app-util,
      simple-bar,
      private,
      ...
    }:
    {
      darwinConfigurations =
        let
          system = "aarch64-darwin";

          overlays = [
            (final: prev: {
              zjstatus = zjstatus.packages.${prev.stdenv.hostPlatform.system}.default;
            })
          ];

          pkgs = import nixpkgs {
            inherit system overlays;
            config = {
              allowUnfree = true;
            };
          };

          mkDarwinWorkstation =
            {
              username,
              hostname,
              theme,
              enableSimpleBar ? true,
            }:
            let
              user = {
                inherit
                  username
                  hostname
                  theme
                  enableSimpleBar
                  ;
                homeDirectory = "/Users/${username}";
              };
              specialArgs = inputs // {
                inherit user;
              };
            in
            nix-darwin.lib.darwinSystem {
              inherit
                system
                pkgs
                specialArgs
                ;
              modules = [
                mac-app-util.darwinModules.default
                stylix.darwinModules.stylix
                {
                  home-manager.extraSpecialArgs = inputs // {
                    inherit user;
                  };
                }
                (private.mkSecrets user)
                ./hosts/${hostname}.nix
              ];
            };
        in
        {
          macbook-pro = mkDarwinWorkstation {
            username = "mrwbarg";
            hostname = "macbook-pro";
            theme = "gruvbox-dark-hard";
          };
          affect = mkDarwinWorkstation {
            username = "mrwbarg";
            hostname = "affect";
            theme = "catppuccin-mocha";
          };
        };
    };
}
