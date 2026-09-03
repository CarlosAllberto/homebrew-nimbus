cask "nimbus" do
  version "0.1.36"
  sha256 "a5b0098cf55afb0c79df44408da197087c3e8f2bb10911b262e1760fe12e15dd"

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

  # Unsigned build, so the zip is quarantined on download like any other —
  # without this, Gatekeeper's spctl assessment rejects it outright
  # ("no usable signature") since an ad-hoc signature has no trust anchor
  # at all, and System Settings > Privacy & Security's "Open Anyway" does
  # not reliably clear that for a fully unsigned app. Stripping quarantine
  # right after install is what actually makes `brew install` result in an
  # app that opens.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Nimbus.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.treendz.nimbus",
    "~/Library/Preferences/com.treendz.nimbus.plist",
  ]
end
