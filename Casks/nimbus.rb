cask "nimbus" do
  version "0.1.42"
  sha256 "3be043d5c6af7690fca5ce05dccfec14314d3a1e9e05d8847fbe1ae8c6e947d3"

  url "https://github.com/CarlosAllberto/nimbus-desktop-releases/releases/download/v#{version}/Nimbus.zip"
  name "Nimbus"
  desc "Menu-bar toolbox for web, image, code, and utility tools"
  homepage "https://www.nimbushelp.com/"

  # Nimbus updates itself via Sparkle once installed — brew upgrade is a
  # catch-up path, not the primary update channel.
  auto_updates true
  # Unsigned: no Apple Developer ID on this build. Gatekeeper blocks it on
  # first launch unless the user right-clicks > Open, or allows it in System
  # Settings > Privacy & Security.

  depends_on macos: :sonoma

  app "Nimbus.app"

  zap trash: [
    "~/Library/Caches/com.treendz.nimbus",
    "~/Library/Preferences/com.treendz.nimbus.plist",
  ]
end
