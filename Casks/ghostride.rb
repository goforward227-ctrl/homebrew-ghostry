cask "ghostride" do
  version "1.0.0"
  sha256 "49a687f2c3f9616f232ff024b84da897451632c7c27212ad7c2758411342dd34"

  url "https://github.com/goforward227-ctrl/ghostride/releases/download/v#{version}/Ghostride-#{version}-arm64.zip"
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
