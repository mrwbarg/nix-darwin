{ ... }:
{
  imports = [
    ./default.nix
  ];

  home.shellAliases = {
    ssh-staging = "aptible ssh --app=homebase-staging";
    ssh-prod = "aptible ssh --app=homebase-two-prod";
    db-prod = "TMPDIR=/tmp aft rds tunnel -d production";
    db-staging = "TMPDIR=/tmp aft rds tunnel -d staging";
    db-replica = "TMPDIR=/tmp aft rds tunnel -d replica";
    wh-prod = "TMPDIR=/tmp aft rds tunnel -d production";
    rh-prod = "TMPDIR=/tmp aft rds tunnel -d redhouse-prod";
    runserver = "service django runserver";
    venv = "source .venv/bin/activate.fish";
  };
}
