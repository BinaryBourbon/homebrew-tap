class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.12.0/fountain-darwin-arm64"
      sha256 "9e184056bfea711ba161e55038bb3ae4077fdf625fefa6a85f9001591c579026"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.12.0/fountain-darwin-amd64"
      sha256 "380f755bd1d79cc5bcb8d411ae0b529dd7255c16c044cd5a13e4987a7d5b7673"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.12.0/fountain-linux-arm64"
      sha256 "6c9c7b81965a5e90b91bb02c1ea3ce7f395d6e3a60974aa23f7141f35fb1fd32"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.12.0/fountain-linux-amd64"
      sha256 "dc9647528228514624bf0759761c4788a40abea87dc637193bd520c0fb47091c"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "fountain-#{os}-#{arch}" => "fountain"
  end

  test do
    assert_match "fountain", shell_output("#{bin}/fountain --help")
  end
end
