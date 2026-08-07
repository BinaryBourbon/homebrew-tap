class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.0/fountain-darwin-arm64"
      sha256 "f301b45f5b200b38383880bd0d21ef66b21b7738911e0de5ec6acf17f7645538"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.0/fountain-darwin-amd64"
      sha256 "228d1555d930517eb33aa580301af5f4d872b02a56e6e764239bce4a202486b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.0/fountain-linux-arm64"
      sha256 "f73fc7419066125931589b90034de8a9ab352d8026379bffeaddb9ebf27ff9c8"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.6.0/fountain-linux-amd64"
      sha256 "b4ed2be09faaa84e67fee8024cddf5e30bef94460f9c81f9ce538581143db352"
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
