{ lib, ... }:
{
  programs.zed-editor.extensions = lib.mkAfter [ "claude-code" ];
}
