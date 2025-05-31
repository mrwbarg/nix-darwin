{
  user,
  home-manager,
  mac-app-util,
  ...
}:
{
  imports = [
    home-manager.darwinModules.home-manager
    ./brew
    ../common/paths.nix
    ./programs
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  home-manager.users."${user.username}" =
    { ... }:
    {
      imports = [
        mac-app-util.homeManagerModules.default
        ../common/paths.nix
        ./misc/aliases
      ];

      programs.home-manager.enable = true;

      home = {
        homeDirectory = "${user.homeDirectory}";
        username = "${user.username}";
        stateVersion = "25.05";

        file.".wallpapers".source = ../wallpapers;
      };
    };

}
