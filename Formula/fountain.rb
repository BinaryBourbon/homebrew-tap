class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.0/fountain-darwin-arm64"
      sha256 "6fced1bf943c7ed81f5d1f96276de1083d9586f5e97bffb48d05085a57d8a57f"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.0/fountain-darwin-amd64"
      sha256 "28e06a418db02def5c82b1d95a7450504cf8983debd704ee000e03da431133e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.0/fountain-linux-arm64"
      sha256 "363085707138db9a016a95138d8cf79bd1746896b3afb36fc21d1003e5bcf0b7"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.0/fountain-linux-amd64"
      sha256 "8c3c7012de6fa2536853ff24d456c0124a73c7b4468020ac9b3fa6f98f656439"
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
