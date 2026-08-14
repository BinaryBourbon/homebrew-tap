class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.1/fountain-darwin-arm64"
      sha256 "90b20fd673274799bb4b01c6072e349af2821f4d01b3c1ea6d69d9d94c17149a"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.1/fountain-darwin-amd64"
      sha256 "3aa9cf22f633b3c6ea8429d3d8a139108a5bc94d93581326c4f11baef8d29460"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.1/fountain-linux-arm64"
      sha256 "93ad03476e6ee60cb0f5ccd728360826748e8bdc652c6dd97af57e8d81069fa5"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.8.1/fountain-linux-amd64"
      sha256 "633060d0986fb4208a295075fed317696b460a01561814de43072cca5ac37f43"
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
