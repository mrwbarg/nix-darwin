{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
      extraFlags = [ "--force" ];
    };

    caskArgs = {
      appdir = "~/Applications";
    };

    casks = [ ];
  };
}
