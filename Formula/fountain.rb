class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.1/fountain-darwin-arm64"
      sha256 "38de36d20a13a4bdce52d8f5d7d6da5ea8ab81baeb6e417ed55e17a06fa601c5"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.1/fountain-darwin-amd64"
      sha256 "026fe507bd14718b80410fbe61492312f1ced31edada4258f6e5a7a45493b8c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.1/fountain-linux-arm64"
      sha256 "b78f1e148d366c2c535176dc0dafab9a7f12a1d6c976c5bf67ca7b41c9ca0b6d"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.1/fountain-linux-amd64"
      sha256 "1fd165611d3be9d6c00733fc5741f5f17d40a6d59ce297256278817646e6912e"
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
