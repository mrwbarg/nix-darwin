{ user, lib, ... }:
let
  uebersichtWidgetPath = "${user.homeDirectory}/Library/Application\ Support/Übersicht/widgets";
in
{
  options.paths.uebersichtWidgetsFolder = lib.mkOption {
    type = lib.types.str;
    default = uebersichtWidgetPath;
    description = "Übersicht widgets folder path";
  };
  options.paths.simpleBarFolder = lib.mkOption {
    type = lib.types.str;
    default = "${uebersichtWidgetPath}/simple-bar";
    description = "simple-bar folder path";
  };
}
