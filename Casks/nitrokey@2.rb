cask "nitrokey@2" do
  arch arm: "arm64", intel: "intel64"
  version "2.3.3"
  sha256 arm:   "3f9c8db7d6e7fd488d3a05fcdf26a9afadb77676f77f703be7b405881f20f8e2",
         intel: "1c248f4e52e331964ab70aa617d5adc0091f96548df4f03693a59af2489d8416"

  url "https://github.com/Nitrokey/nitrokey-app2/releases/download/v#{version}/nitrokey-app2-v#{version}-#{arch}.pkg",
      verified: "github.com/Nitrokey/nitrokey-app2/"
  name "Nitrokey App 2"
  desc "Application to manage Nitro Key 3 devices"
  homepage "https://docs.nitrokey.com/software/nk-app2/"

  depends_on macos: ">= :high_sierra"

  pkg "nitrokey-app2-v#{version}-#{arch}.pkg"

  uninstall quit:    "nitrokey-app2",
            pkgutil: "com.nitrokey.nitrokey-app2"

  zap trash: "~/Library/Saved Application State/nitrokey-app2.savedState"
end
