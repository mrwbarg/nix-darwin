{
  pkgs,
  lib,
  ...
}:
let
  affectCss = builtins.readFile ../styles/affect.css;
  defaultCss = builtins.readFile ../styles/default.css;
in
{
  widgets = {
    netstatsWidget = true;
    cpuWidget = true;
    memoryWidget = true;
  };

  userWidgets = {
    userWidgetsList = {
      "1" = {
        title = "GitHub";
        icon = "GitHub";
        backgroundColor = "--accent";
        output = "${pkgs.gh}/bin/gh search prs --state=open --owner=affect-therapeutics --review-requested=@me | wc -l";
        onClickAction = "open -u https://github.com/pulls/review-requested";
        onRightClickAction = "";
        onMiddleClickAction = "";
        refreshFrequency = 600000;
        showOnDisplay = "";
        active = true;
        noIcon = false;
      };
    };
  };
  customStyles = {
    styles = lib.concatStrings [
      defaultCss
      affectCss
    ];
  };
}
