class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.1/fountain-darwin-arm64"
      sha256 "73b77d2937d408663c22969932f4f59f54bd1e04abe2a5ff84fa9ae27c69b742"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.1/fountain-darwin-amd64"
      sha256 "e47957dc2517d839de4238c1f7a1432940ebfc849ca9871b48d80a2e89a4b815"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.1/fountain-linux-arm64"
      sha256 "1e59c922f83a803a987aebf7c5a8fc7e5ec1958ab37d45216a25fe185251d438"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.1/fountain-linux-amd64"
      sha256 "4fc8dd8e6550931e7d4242fac3db56d1c3e812ff8d0d3157d96580af2e8e9d42"
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
