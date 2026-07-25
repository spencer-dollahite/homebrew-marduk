cask "marduk" do
  version "0.4.13"
  sha256 "12ffd7d40680b8beb7abd354828bb8a5c64310b72cc39c8beecff15a3e577475"

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
