{
  description = "mrwbarg's NixOS and macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zjstatus = {
      url = "github:dj95/zjstatus";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
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
      private,
      ...
    }:
    {
      darwinConfigurations =
        let
          system = "aarch64-darwin";

          overlays = [
            (final: prev: {
              zjstatus = zjstatus.packages.${prev.system}.default;
            })
          ];

          pkgs = import nixpkgs {
            inherit system overlays;
            config = {
              allowUnfree = true;
            };
          };

          mkDarwinWorkstation =
            username: hostname: theme:
            let
              user = {
                inherit username hostname theme;
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
                { home-manager.extraSpecialArgs = { inherit user; }; }
                (private.mkSecrets user)
                ./hosts/${hostname}.nix
              ];
            };
        in
        {
          macbook-pro = mkDarwinWorkstation "mrwbarg" "macbook-pro" "gruvbox-dark-hard";
          affect = mkDarwinWorkstation "mrwbarg" "affect" "catppuccin-mocha";
        };
    };

}
