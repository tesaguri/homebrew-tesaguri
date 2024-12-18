cask "flash-player" do
  version "32.0.0.465"
  sha256 "236ecef54a7d6c3eed739c74b7e14946b07b6156cbcedda3bbbf444f1d17023a"

  url "https://fpdownload.macromedia.com/pub/flashplayer/updaters/#{version.major}/flashplayer_#{version.major}_sa.dmg",
      verified: "fpdownload.macromedia.com/"
  name "Adobe Flash Player projector"
  desc "Adobe Flash player"
  homepage "https://web.archive.org/web/20220401020702/https://www.adobe.com/support/flashplayer/debug_downloads.html"

  # https://github.com/Homebrew/homebrew-cask/commit/2fb7893265e2cdd49d9c0f77a419615c3f7dc43f
  deprecate! date: "2021-04-14", because: :unmaintained

  app "Flash Player.app"

  zap trash: [
    "~/Library/Caches/Adobe/Flash Player",
    "~/Library/Caches/com.macromedia.Flash Player.app",
    "~/Library/HTTPStorages/com.macromedia.Flash Player.app",
    "~/Library/Preferences/com.macromedia.Flash Player.app.plist",
    "~/Library/Preferences/Macromedia/Flash Player",
    "~/Library/Saved Application State/com.macromedia.Flash Player.app.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
