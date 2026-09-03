cask "nimbus" do
  version "0.1.35"
  sha256 "82c7e839e3610bdc465fe6d38892592043561e40a12ba835358a62137e1db801"

  url "https://github.com/CarlosAllberto/nimbus-desktop-releases/releases/download/v#{version}/Nimbus.zip"
  name "Nimbus"
  desc "Menu-bar toolbox for web, image, code, and utility tools"
  homepage "https://www.nimbushelp.com"

  # Nimbus updates itself via Sparkle once installed — brew upgrade is a
  # catch-up path, not the primary update channel.
  auto_updates true

  # Unsigned: no Apple Developer ID on this build. Gatekeeper blocks it on
  # first launch unless the user right-clicks > Open, or allows it in System
  # Settings > Privacy & Security.

  app "Nimbus.app"

  zap trash: [
    "~/Library/Preferences/com.treendz.nimbus.plist",
    "~/Library/Caches/com.treendz.nimbus",
  ]
end
