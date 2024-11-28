cask "jpki" do
  version "3.7-01-00-01"
  sha256 "92f5c80f6dec2497c6df92a570fd7ec40472119c6395229e3e8828f1b0b16c23"

  url "https://www.jpki.go.jp/client/download/101/JPKIMac_#{version.major.rjust(2, "0")}-#{version.minor.split("-").first.rjust(2, "0")}#{version.split("-", 2)[1].then {|pre| "_#{pre}" }}.dmg"
  name "JPKI"
  desc "Electronic identity card software for Japan"
  homepage "https://www.jpki.go.jp/"

  livecheck do
    url "https://www.jpki.go.jp/download/mac.html"
    regex(%r{^\s*<a .*href="\.\./client/download/101/JPKIMac_(\d{2}-\d{2}(?:_\d+(-\d+)*))\.dmg"})
    strategy :page_match do |page, regex|
      match = page.match(regex)
      next if match.blank?
      (major_minor, pre) = match[1].split("_")
      "#{major_minor.split("-").map(&:to_i).join(".")}#{pre.then {|pre| "-#{pre}" }}"
    end
  end

  depends_on macos: ">= :monterey"

  pkg "JPKIInstall.pkg"

  uninstall pkgutil: "jp.go.jpki",
    script: {
      executable: "JPKIUninstall.command",
      input: ["Y"],
      sudo: true,
    }
end
