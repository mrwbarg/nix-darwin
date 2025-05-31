{
  user,
  pkgs,
  ...
}:
{
  imports = [
    ../common/system.nix
    ../common/fonts.nix
  ];

  networking.computerName = "${user.hostname}";
  networking.localHostName = "${user.hostname}";

  # set shell globally
  programs.fish.enable = true;
  users.users."${user.username}" = {
    home = "${user.homeDirectory}";
    shell = pkgs.fish;
  };

  system.primaryUser = "${user.username}";

}
