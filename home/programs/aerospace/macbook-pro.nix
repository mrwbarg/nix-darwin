{ user, lib, ... }:
let
  enableSimpleBar = user.enableSimpleBar or true;
in
{
  services.aerospace = {
    settings = {
      default-root-container-layout = lib.mkForce "accordion";

      gaps = {
        inner = {
          horizontal = lib.mkForce 3;
          vertical = lib.mkForce 3;
        };
        outer = {
          left = lib.mkForce 3;
          bottom = lib.mkForce 3;
          right = lib.mkForce 3;
          top = lib.mkForce (if enableSimpleBar then 38 else 3);
        };
      };
    };
  };
}
