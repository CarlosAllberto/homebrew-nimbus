cask "nimbus" do
  version "0.1.43"
  sha256 "62e4866836e52b1f4175c10804dbdc6ed36e8cebcc15618ca9455131aa4bd4de"

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
