{ ... }:
{
  imports = [
    ./default.nix
  ];

  home.shellAliases = {
    ssh-staging = "aptible ssh --app=homebase-staging";
    ssh-prod = "aptible ssh --app=homebase-two-prod";
    db-prod = "aft rds tunnel -d production";
    db-staging = "aft rds tunnel -d staging";
    db-replica = "aft rds tunnel -d replica";
    wh-prod = "aft rds tunnel -d production";
    rh-prod = "aft rds tunnel -d redhouse-prod";
    runserver = "service django runserver";
    venv = "source .venv/bin/activate.fish";
  };
}
