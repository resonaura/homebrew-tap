cask "resostage" do
  version "0.1.0"
  sha256 "072aca86cf90105c2dbfdee495cfcc335dd9db8f214d72449b8b3ab7f2adaf29"

  url "https://github.com/resonaura/resostage/releases/download/v#{version}/ResoStage-#{version}.pkg",
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

  pkg "ResoStage-#{version}.pkg"

  uninstall pkgutil: "com.resonaura.resostage.app",
            delete:  "/Applications/ResoStage.app"

  zap trash: [
    "~/Library/Application Support/ResoStage",
    "~/Library/Preferences/com.resonaura.resostage.plist",
    "~/Library/Saved Application State/com.resonaura.resostage.savedState",
  ]
end
