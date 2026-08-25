class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.13.0/fountain-darwin-arm64"
      sha256 "b228bed7c83c0b50e289f2c9c5b7ff314c1ac8f4a2428338e89dda802261861b"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.13.0/fountain-darwin-amd64"
      sha256 "a7783ee5c8a3f0ba82567e1a67c31059ea87e904d9f9d109d748c0db9846d397"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.13.0/fountain-linux-arm64"
      sha256 "0acd487c16bd488432ea3211a847190d4eaf90c356bd116fde42f4d7469fe510"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.13.0/fountain-linux-amd64"
      sha256 "17bfb27f48a524eab4995b519e3ec9b0af6bbea6b88a65ebb6cfadc2485b0d6d"
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
