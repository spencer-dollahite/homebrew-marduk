cask "marduk" do
  version "0.3.2"
  sha256 "d5f978d83712f2ca52074c591c07c7498b1eb980b24ab2b03e45256fa8d0de35"

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
