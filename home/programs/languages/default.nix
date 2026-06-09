{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    ruff
    black
    mypy

    go
    gopls

    nixfmt
    nixd
    nil
  ];
}
