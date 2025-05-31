{
  pkgs,
  config,
  user,
  ...
}:
let
  colors = config.lib.stylix.colors;
in
{
  home.packages = with pkgs; [
    flameshot
  ];

  xdg.configFile."flameshot/flameshot.ini".source = (pkgs.formats.ini { }).generate "..." {
    General = {
      savePath = "${user.homeDirectory}/Pictures";
      saveAsFileExtension = ".png";
      uiColor = colors.withHashtag.base00;
      contrastUiColor = colors.withHashtag.base0B;
      showHelp = false;
      disabledTrayIcon = true;
      startupLaunch = true;
      showStartupLaunchMessage = false;
    };
  };
}
