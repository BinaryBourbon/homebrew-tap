class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.2.1/fountain-darwin-arm64"
      sha256 "b28d608cc31236b500c6845aa82e27f7dea9275c2bdcfa0e2ce9a2fb782e4673"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.2.1/fountain-darwin-amd64"
      sha256 "9d3d21a5df50a3adad66806b4077296cb39263d0d69df73d74924e91883ff1f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.2.1/fountain-linux-arm64"
      sha256 "0e0238af0fd399629b20825c5f3b5a3dcfd0439f415fc53136ed5d9ac5abb3fe"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.2.1/fountain-linux-amd64"
      sha256 "332dbad121f925fe90ff88a65334786c482b40de35b56251870f3bafec24cf9d"
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
