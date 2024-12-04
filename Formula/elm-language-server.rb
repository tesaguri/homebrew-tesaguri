class ElmLanguageServer < Formula
  desc "Language server for the Elm language"
  homepage "https://github.com/elm-tooling/elm-language-server"
  url "https://registry.npmjs.org/@elm-tooling/elm-language-server/-/elm-language-server-2.8.0.tgz"
  sha256 "287eb31a035bceebf1f88dc4531124d7eaa7ff50bf14b8b624ceae4ef63d0f92"
  license "MIT"
  head "https://github.com/elm-tooling/elm-language-server.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elm-language-server --version")
  end
end
