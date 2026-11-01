cask "touch-my-bar" do
  version "0.3.0"
  # Replaced on each release by Scripts/release.sh in the app repo.
  sha256 "0b6f68e47e8b046aa3664e2732564e773357dae72950c2a7b70b2235ab956873"

  url "https://github.com/jdmry/touch-my-bar/releases/download/v#{version}/TouchMyBar-#{version}.dmg"
  name "Touch My Bar"
  desc "Replaces the Touch Bar with a dock and system controls"
  homepage "https://github.com/jdmry/touch-my-bar"

  # Touch Bar hardware only: 2016-2022 MacBook Pro. The build is
  # universal, so there is no architecture requirement to state.
  depends_on macos: :ventura

  app "Touch My Bar.app"

  uninstall quit: "dev.ctoasap.touchmybar"

  # Settings are the only thing it leaves behind; it writes no cache.
  zap trash: "~/Library/Preferences/dev.ctoasap.touchmybar.plist"

  caveats <<~EOS
    Touch My Bar is not notarized by Apple, so Gatekeeper will refuse to
    open it until the quarantine attribute is removed:

      xattr -dr com.apple.quarantine "/Applications/Touch My Bar.app"

    Running that means trusting this build without Apple having checked
    it. The source is public if you would rather read it or build your
    own: https://github.com/jdmry/touch-my-bar

    Then enable the Control Strip in System Settings > Keyboard >
    Touch Bar Settings. The bar is yours for as long as the app runs;
    tap the Control Strip icon to switch back to the normal one, or
    quit from the menu bar icon to stop altogether.
  EOS
end
