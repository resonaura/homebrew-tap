cask "resostage" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "6fbeb1e6e17a90c295666ee03bfcc349aab490b29bf99f35d1d35d3003890f65",
         intel: "0f3c16f5b8d7d9c7b6188ca64e2d58d064e997b874c47f65c0afe436effb909c"

  url "https://github.com/resonaura/resostage/releases/download/v#{version}/ResoStage-#{version}-mac-#{arch}.pkg",
      verified: "github.com/resonaura/resostage/"
  name "ResoStage"
  desc "Live performance audio workstation and stage playback engine"
  homepage "https://github.com/resonaura/resostage"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :ventura

  pkg "ResoStage-#{version}-mac-#{arch}.pkg"

  uninstall pkgutil: "com.resonaura.resostage.app",
            delete:  "/Applications/ResoStage.app"

  zap trash: [
    "~/Library/Application Support/ResoStage",
    "~/Library/Preferences/com.resonaura.resostage.plist",
    "~/Library/Saved Application State/com.resonaura.resostage.savedState",
  ]
end
