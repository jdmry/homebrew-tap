cask "touch-my-bar" do
  version "0.1.0"
  # Replaced on each release by Scripts/release.sh in the app repo.
  sha256 "179c01b57983bf3835adf60f3ca9d9f5612241db925087c62e7700f55bdd0669"

  url "https://github.com/jdmry/touch-my-bar/releases/download/v#{version}/TouchMyBar-#{version}.dmg"
  name "Touch My Bar"
  desc "Replaces the Touch Bar with a dock and system controls"
  homepage "https://github.com/jdmry/touch-my-bar"

  # Touch Bar hardware only: 2016-2022 MacBook Pro. The build is
  # universal, so there is no architecture requirement to state.
  depends_on macos: :ventura

  app "Touch My Bar.app"

  uninstall quit: "dev.ctoasap.touchmybar"

  zap trash: [
    "~/Library/Preferences/dev.ctoasap.touchmybar.plist",
    "~/Library/Caches/dev.ctoasap.touchmybar",
  ]

  caveats <<~EOS
    Touch My Bar is not notarized by Apple, so Gatekeeper will refuse to
    open it unless it was installed without the quarantine attribute:

      brew install --cask --no-quarantine touch-my-bar

    If you already installed it the normal way, remove the attribute:

      xattr -dr com.apple.quarantine "/Applications/Touch My Bar.app"

    Then enable the Control Strip in System Settings > Keyboard >
    Touch Bar Settings, or use the menu bar icon to toggle the bar.
  EOS
end
