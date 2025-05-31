{ pkgs, ... }:
{
  home.shellAliases = {
    l = "ls -lh";
    ll = "ls -lha";
    ".." = "cd ..";
    gwip = "${pkgs.git}/bin/git add -A && ${pkgs.git}/bin/git commit -m '---wip--- [skip ci]' --no-verify";
    xcd = "cd $(${pkgs.xplr}/bin/xplr)/";
  };
}
