{ pkgs, ... }:
{
  time.timeZone = "America/Sao_Paulo";
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 6;

  environment.variables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
  };

  system.activationScripts.text =
    let
      yabai = "${pkgs.yabai}/bin/yabai";
      skhd = "${pkgs.skhd}/bin/skhd";
    in
    ''
      sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

      # grid icons
      /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
      /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
      /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

      defaults write com.apple.assistant.support 'Assistant Enabled' -bool false
      sudo launchctl disable "user/$UID/com.apple.assistantd"
      sudo launchctl disable 'system/com.apple.assistantd'
      sudo launchctl disable "user/$UID/com.apple.Siri.agent"
      sudo launchctl disable 'system/com.apple.Siri.agent'
      defaults write com.apple.SetupAssistant 'DidSeeSiriSetup' -bool True
      defaults write com.apple.systemuiserver 'NSStatusItem Visible Siri' 0
      defaults write com.apple.Siri 'StatusMenuVisible' -bool false
      defaults write com.apple.Siri 'UserHasDeclinedEnable' -bool true
      defaults write com.apple.assistant.support 'Siri Data Sharing Opt-In Status' -int 2

      osascript -e 'tell application id "tracesOf.Uebersicht" to refresh'
      sudo ${yabai} --load-sa
      ${skhd} --reload

      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

  security.pam.services.sudo_local = {
    enable = true;
    touchIdAuth = true;
  };

  system.defaults = {
    NSGlobalDomain = {
      _HIHideMenuBar = true;
      AppleShowAllFiles = true;
      AppleInterfaceStyle = "Dark";
      ApplePressAndHoldEnabled = false;
      AppleFontSmoothing = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    LaunchServices = {
      LSQuarantine = false;
    };
    dock = {
      autohide = true;
      showhidden = true;
      show-recents = false;
      mru-spaces = false;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      wvous-tl-corner = 1;
      wvous-bl-corner = 1;
      wvous-tr-corner = 1;
      wvous-br-corner = 1;
    };
    finder = {
      AppleShowAllExtensions = true;
      QuitMenuItem = true;
      FXDefaultSearchScope = "SCcf";
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
    };
    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };
  };
}
