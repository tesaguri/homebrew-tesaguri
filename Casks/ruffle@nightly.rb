cask "ruffle@nightly" do
  version "2024-11-13"
  sha256 "3518773e12ce163f087e3339eabd73a9b57cabef4dfb21971ec60cc6d5df8503"

  url "https://github.com/ruffle-rs/ruffle/releases/download/nightly-#{version}/ruffle-nightly-#{version.tr("-", "_")}-macos-universal.tar.gz",
      verified: "github.com/ruffle-rs/ruffle/"
  name "Ruffle"
  desc "Open source Flash Player emulator"
  homepage "https://ruffle.rs/"

  livecheck do
    url :url
    regex(/^nightly-(\d+(?:-\d+)*)$/)
  end

  app "Ruffle.app"
end
