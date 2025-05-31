{ lib, ... }:
{
  programs.chromium = {
    extensions = lib.mkAfter [
      { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } # 1password
    ];
  };
}
