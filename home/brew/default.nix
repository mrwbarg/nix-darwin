{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    caskArgs = {
      appdir = "~/Applications";
      no_quarantine = true;
    };

    casks = [
      "ubersicht"
    ];
  };
}
