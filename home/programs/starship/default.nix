{ ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = false;
    settings = {
      add_newline = false;
    };
  };
}
