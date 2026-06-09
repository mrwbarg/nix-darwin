{ pkgs, ... }:
{
  services.aerospace = {
    settings = {
      on-window-detected = [
        {
          "if" = { "app-id" = "co.tuple.app"; };
          run = "layout floating";
        }
        {
          "if" = { "app-id" = "com.displaylink.useragent"; };
          run = "layout floating";
        }
        {
          "if" = { "app-id" = "org.cocoapodes.licecap"; };
          run = "layout floating sticky";
        }
      ];
    };
  };
}
