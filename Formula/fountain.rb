class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.1/fountain-darwin-arm64"
      sha256 "1cd3c0b4ee28a9f002b2dc5cc5496a40ebcb72fb08a0589723d18141f7e68411"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.1/fountain-darwin-amd64"
      sha256 "c4abb3a4119d6c4d7cb5023d95e9e126b8cdb172493201e45fa35e1f05764487"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.1/fountain-linux-arm64"
      sha256 "a034e8e852fdd78d7485dd896d0bf99b9168e31e9693f7c7e39898bcc82c64e0"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.1/fountain-linux-amd64"
      sha256 "3f57d84757e5c4abef0fcb0b88e3e5792ad42945fd8e6e2827de4ea099add8cf"
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
