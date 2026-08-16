class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.11.0/fountain-darwin-arm64"
      sha256 "9cb6b5d040bec5199c2061ce3ce6e1f1077795f0d7e4c5db893ba99dd45c952b"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.11.0/fountain-darwin-amd64"
      sha256 "3869c190b04c044f8bc7e673b71c370ac4977ed13b02d3586ef447c11c22e9b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.11.0/fountain-linux-arm64"
      sha256 "9f905f971d3649ed4bf076ecca97b73ea750b08d6cdc6d574b32e617c5703857"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.11.0/fountain-linux-amd64"
      sha256 "c00221e6ecbbb8b2dc4dcfb4487b6fb552f0551e6e4f11f9aad3314ca85fb4b3"
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
