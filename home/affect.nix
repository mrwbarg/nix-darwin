{
  user,
  ...
}:
{

  imports = [
    ./default.nix
    ./programs/affect.nix
    ./brew/affect.nix
  ];

  home-manager.users."${user.username}" =
    { ... }:
    {
      imports = [
        ./misc/aliases/affect.nix
        ./misc/tuple-triggers
        ./accounts/affect.nix
      ];
    };
}
