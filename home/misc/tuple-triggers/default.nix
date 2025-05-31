{ ... }:
{
  home.file.".tuple/triggers/keycastr-triggers/screen-share-ended" = {
    source = ./scripts/keycastr/screen-share-ended;
    executable = true;
  };

  home.file.".tuple/triggers/keycastr-triggers/screen-share-started" = {
    source = ./scripts/keycastr/screen-share-started;
    executable = true;
  };
}
