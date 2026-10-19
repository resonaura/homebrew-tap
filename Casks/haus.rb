cask "haus" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "4c74bcad2e09e67865e96eb5f593241c043bab4409f17a28c0c7bc3ccfbfebc7",
         intel: "c0fc72da54920e79bf2a36ef8eda9359773468d8071bf85b3a0d019f9baa4a18"

  url "https://github.com/resonaura/haus/releases/download/v#{version}/Haus-#{version}-mac-#{arch}.pkg"
  name "Haus"
  desc "Smart home dashboard for Home Assistant"
  homepage "https://github.com/resonaura/haus"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :ventura

  pkg "Haus-#{version}-mac-#{arch}.pkg"

  uninstall pkgutil: "app.haus.desktop",
            delete:  "/Applications/Haus.app"

  zap trash: [
    "~/Library/Application Support/Haus",
    "~/Library/Preferences/app.haus.desktop.plist",
    "~/Library/Saved Application State/app.haus.desktop.savedState",
  ]
end
