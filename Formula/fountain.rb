class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.15.0/fountain-darwin-arm64"
      sha256 "cee7b1eb52f5d7027169d2a8a888108c9639677e7a24b51ca85842fabf198fb9"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.15.0/fountain-darwin-amd64"
      sha256 "001d8cdea886e819c87aade0a0883db362372187e6602118d1f3e6e30ce8bfd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.15.0/fountain-linux-arm64"
      sha256 "01dcb3b0e9873921f9abaa4951497e92edb5e2c72b8f69c9efd7c59f66051868"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.15.0/fountain-linux-amd64"
      sha256 "8e383d0edf6e632c38d75281eb9bb7982abf91e0d199dfdcbb6ca5a0b67dae36"
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
