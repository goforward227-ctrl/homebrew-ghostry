cask "ghostride" do
  version "1.0.0"
  sha256 "586c1e70ee6b63045db3097bffbcbbac11e29503c0e28d6c23a97aa117b1cd1d"

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
    system_command "/usr/bin/codesign",
                   args: ["--deep", "--force", "--sign", "-", "#{appdir}/Ghostride.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ghostride",
    "~/Library/Preferences/com.ghostride.app.plist",
  ]
end
