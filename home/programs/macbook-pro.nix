{
  user,
  ...
}:
{
  imports = [
    ./default.nix
    ./aerospace/macbook-pro.nix
  ];

  home-manager.users."${user.username}" =
    { ... }:
    {
      imports = [
        ./brave/macbook-pro.nix
      ];
    };
}
