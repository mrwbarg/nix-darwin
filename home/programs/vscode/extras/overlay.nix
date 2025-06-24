{ config, pkgs, ... }:
pkgs.vscode.overrideAttrs (prev: {
  # this injects css during the vscode installation process so I can make the UI look
  # the way I want it to. Right now, I'm just changing the entire's UI font.
  postInstall =
    prev.postInstall or ""
    + ''
      cssFile=$(find $out -name 'workbench.desktop.main.css' | head -n1)
      echo "Injecting custom CSS into $cssFile!!"
      echo "/* Injected from Nix */ .mac { font-family: '${config.stylix.fonts.monospace.name}' !important; }" >> "$cssFile"
    '';
})
