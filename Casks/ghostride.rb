cask "ghostride" do
  version "1.0.1"
  sha256 "c8aff5985201223f0ea5e5db559cfbfd93ab33b78c1646f6a374989c4c0c2e12"

  url "https://github.com/goforward227-ctrl/ghostride/releases/download/v#{version}/Ghostride.zip"
  name "Ghostride"
  desc "Menu bar app for monitoring and approving Claude Code sessions"
  homepage "https://github.com/goforward227-ctrl/ghostride"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "Ghostride.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ghostride.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ghostride",
    "~/Library/Preferences/com.ghostride.app.plist",
  ]
end
