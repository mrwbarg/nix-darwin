{
  user,
  ...
}:
{
  imports = [
    ./default.nix
    ./yabai/macbook-pro.nix
  ];

  home-manager.users."${user.username}" =
    { ... }:
    {
      imports = [
        ./brave/macbook-pro.nix
      ];
    };
}
