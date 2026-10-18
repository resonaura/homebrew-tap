cask "haus" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "2f73816f8543c6ddf201a1c1b47bcd5bc9421c7e1bc0b9f1869b1792c3a42027",
         intel: "0bbc6514252f796ac0a59311e2e369346af12ca1950e6720e93a8bdbc751f63c"

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
