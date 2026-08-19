{ pkgs, lib, ... }:
{
  services.aerospace = {
    settings = {
      # No ubersicht bar on this host, so no need for extra top gap.
      gaps.outer.top = lib.mkForce 5;

      on-window-detected = [
        {
          "if" = {
            "app-id" = "co.tuple.app";
          };
          run = "layout floating";
        }
        {
          "if" = {
            "app-id" = "com.displaylink.useragent";
          };
          run = "layout floating";
        }
        {
          "if" = {
            "app-id" = "org.cocoapodes.licecap";
          };
          run = "layout floating";
        }
      ];
    };
  };
}
