cask "haus" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "93f718b761cbee0219c3e64a285b8db585dd4e615210021669515cebb1966772",
         intel: "ae44b95d04883c32a7e7fe67e3e62bd2cb9fd544b3fc9fbcdbf501f752eb87e4"

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
