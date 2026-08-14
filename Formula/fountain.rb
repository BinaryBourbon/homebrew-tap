class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.0/fountain-darwin-arm64"
      sha256 "eb4f31fbda9d7478f5a58b88cdf7ec550df00fde8290519744355dad77dfb3cf"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.0/fountain-darwin-amd64"
      sha256 "0b0cb07074e807ed00e74ff355574c9f6e3cf016515a63f0257d81cb88d83fba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.0/fountain-linux-arm64"
      sha256 "4640a3ec5e4cf375f37622ab7eac9aafb1dcec27aa670b63ebd7670a8264d941"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.0/fountain-linux-amd64"
      sha256 "c029cbb57144b83b3f841493ebe014d1949eb2791c38b37b13aebc9790260585"
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
