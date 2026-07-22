cask "marduk" do
  version "0.4.11"
  sha256 "1f3805d0d609b9b9c3ec220ead12d1c974a42d3216625b3a81e2c284a13633c1"

  # Marduk self-updates (u/uu and the periodic timer swap the bundle in
  # place) — Chrome-style: brew leaves the version alone unless --greedy
  auto_updates true

  url "https://github.com/spencer-dollahite/marduk/releases/download/v#{version}/Marduk.dmg"
  name "Marduk"
  desc "Audio-first assistive platform for macOS with Vim-style modal navigation"
  homepage "https://github.com/spencer-dollahite/marduk"

  depends_on macos: ">= :tahoe"

  app "Marduk.app"
  binary "#{appdir}/Marduk.app/Contents/MacOS/marduk"

  caveats <<~EOS
    Open Marduk from Applications — it installs itself and talks you
    through the rest, including the Accessibility permission.
  EOS

  uninstall launchctl: "com.marduk.daemon"
  zap trash: [
    "~/.config/marduk",
    "~/Library/LaunchAgents/com.marduk.daemon.plist",
    "~/Library/Logs/marduk.log",
  ]
end
