# Builds https://github.com/affect-therapeutics/toolbar into a real,
# fixed-path Toolbar.app in ~/Applications, so it behaves like any other
# Mac app: Spotlight-discoverable, killable, and relaunchable by hand.
#
# This can't be a normal Nix derivation: nixpkgs' darwin `swift` doesn't
# ship SwiftPM, and SwiftPM itself shells out to `sandbox-exec` while
# resolving the manifest, which Nix's own build sandbox refuses to nest
# ("sandbox_apply: Operation not permitted"). Upstream's own flake works
# around this the same way — building outside the Nix sandbox as a plain
# script — but does so into a disposable `~/.cache` app that isn't
# Applications-visible. This mirrors that build, landing the result at a
# stable path instead.
{ user, toolbar, ... }:
{
  home-manager.users."${user.username}" =
    { lib, ... }:
    {
      home.activation.affectToolbar = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        set -euo pipefail

        srcDir="$HOME/.cache/toolbar/src"
        appDir="$HOME/Applications/Toolbar.app"
        revFile="$srcDir/.nix-source-hash"
        newRev="${toolbar.narHash}"

        mkdir -p "$srcDir"

        if [ ! -f "$revFile" ] || [ "$(cat "$revFile")" != "$newRev" ]; then
          rm -rf "$srcDir"
          mkdir -p "$srcDir"
          cp -R "${toolbar}/." "$srcDir/"
          chmod -R u+w "$srcDir"

          (
            cd "$srcDir"
            /usr/bin/swift build -c release
          )

          rm -rf "$appDir"
          contentsDir="$appDir/Contents"
          mkdir -p "$contentsDir/MacOS" "$contentsDir/Resources"

          cp "$srcDir/.build/release/Toolbar" "$contentsDir/MacOS/Toolbar"
          cp "$srcDir/Sources/Toolbar/Resources/AppIcon.icns" "$contentsDir/Resources/AppIcon.icns"
          cp "$srcDir/Sources/Toolbar/Resources/MenuBarIcon.png" "$contentsDir/Resources/MenuBarIcon.png"
          cp "$srcDir/Sources/Toolbar/Resources/SettingsLogo.png" "$contentsDir/Resources/SettingsLogo.png"
          cp "$srcDir/Sources/Toolbar/Resources/SettingsLogoRussell.png" "$contentsDir/Resources/SettingsLogoRussell.png"
          cp "$srcDir/Sources/Toolbar/Resources/RussellIcon.png" "$contentsDir/Resources/RussellIcon.png"

          cat > "$contentsDir/Info.plist" <<PLIST
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            <key>CFBundleExecutable</key>
            <string>Toolbar</string>
            <key>CFBundleIdentifier</key>
            <string>com.affecttherapeutics.toolbar</string>
            <key>CFBundleName</key>
            <string>Toolbar</string>
            <key>CFBundlePackageType</key>
            <string>APPL</string>
            <key>CFBundleShortVersionString</key>
            <string>0.1.0</string>
            <key>CFBundleIconFile</key>
            <string>AppIcon</string>
            <key>LSUIElement</key>
            <true/>
        </dict>
        </plist>
        PLIST

          echo "$newRev" > "$revFile"
        fi
      '';

      launchd.agents.affect-toolbar = {
        enable = true;
        config = {
          Program = "${user.homeDirectory}/Applications/Toolbar.app/Contents/MacOS/Toolbar";
          RunAtLoad = true;
          StandardOutPath = "${user.homeDirectory}/Library/Logs/affect-toolbar.log";
          StandardErrorPath = "${user.homeDirectory}/Library/Logs/affect-toolbar.log";
        };
      };
    };
}
