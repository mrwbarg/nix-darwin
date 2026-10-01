{
  user,
  ...
}:
{
  imports = [
    ./default.nix
  ];

  home-manager.users."${user.username}" =
    { ... }:
    {
      imports = [
        ./brave/macbook-pro.nix
      ];
    };
}
