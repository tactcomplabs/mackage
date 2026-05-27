class Mackage < Formula
  include Language::Python::Shebang

  desc "Build macOS .pkg installers from a single JSON config via pkgbuild/productbuild"
  homepage "https://github.com/tactcomplabs/mackage"
  url "https://github.com/tactcomplabs/mackage/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "296c60411d3e73ae17847e19c0f8f805c4316ab45cc509481a3d9e7ae45f6608"
  license "Apache-2.0"
  head "https://github.com/tactcomplabs/mackage.git", branch: "main"

  # mackage wraps Apple's pkgbuild/productbuild, which only exist on macOS.
  depends_on :macos
  depends_on "python@3.13"

  def install
    # mackage is a single self-contained stdlib-only script; pin its shebang
    # to the Homebrew Python this formula depends on.
    rewrite_shebang detected_python_shebang, "mackage"
    bin.install "mackage"
  end

  test do
    assert_match "usage: mackage", shell_output("#{bin}/mackage --help")
  end
end
