class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.1/fountain-darwin-arm64"
      sha256 "d0366397d288bb5ccfa0f5b05c393504dcea8e77a208d6ae71e30c78f8dde8ae"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.1/fountain-darwin-amd64"
      sha256 "080e11e025486b8f4a25f8fff4f63cc40b74efc10982f2c587f5b89fc35d9180"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.1/fountain-linux-arm64"
      sha256 "047c38c784c8377abebd3954141528dca3081ef9c3e10498f2d97bf09d073354"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.1/fountain-linux-amd64"
      sha256 "db4552afe2293b35db018db935c57b53953523ec6005088b35b7841bf7936e2e"
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
