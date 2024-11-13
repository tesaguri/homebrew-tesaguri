cask "flash-player-debugger" do
  version "32.0.0.465"
  sha256 "7a9a043e1481768d58ed9de8ff8644aa95d73ea7a0f5ba59b77fd4e71f7c25fd"

  url "https://fpdownload.macromedia.com/pub/flashplayer/updaters/#{version.major}/flashplayer_#{version.major}_sa_debug.dmg"
  name "Adobe Flash Player projector content debugger"
  desc "Debugger for Adobe Flash player"
  homepage "https://web.archive.org/web/20220401020702/https://www.adobe.com/support/flashplayer/debug_downloads.html"

  # https://github.com/Homebrew/homebrew-cask/commit/2fb7893265e2cdd49d9c0f77a419615c3f7dc43f
  deprecate! date: "2021-04-14", because: :unmaintained

  # Renamed to avoid conflict with flash-player.
  app "Flash Player.app", target: "Flash Player Debugger.app"

  zap trash: [
    "~/Library/Caches/Adobe/Flash Player",
    "~/Library/Caches/com.macromedia.Flash Player Debugger.app",
    "~/Library/HTTPStorages/com.macromedia.Flash Player Debugger.app",
    "~/Library/Preferences/Macromedia/Flash Player",
    "~/Library/Preferences/com.macromedia.Flash Player Debugger.app.plist",
    "~/Library/Saved Application State/com.macromedia.Flash Player.app.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
