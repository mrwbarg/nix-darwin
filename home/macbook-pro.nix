{ user, ... }:
{
  imports = [
    ./default.nix
    ./programs/macbook-pro.nix
    ./brew/macbook-pro.nix
  ];

  home-manager.users."${user.username}" =
    { ... }:
    {
      imports = [
        ./accounts/personal.nix
      ];
    };
}
