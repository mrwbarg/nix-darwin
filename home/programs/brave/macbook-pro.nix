{ lib, ... }:
{
  programs.chromium = {
    extensions = lib.mkAfter [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
    ];
  };
}
