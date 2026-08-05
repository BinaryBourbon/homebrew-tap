class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.0/fountain-darwin-arm64"
      sha256 "f1825dbb964b66372aaaf724ee50ecdadf7337a7065f7798c69301f895b7a05c"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.0/fountain-darwin-amd64"
      sha256 "84d7eb4fc049ad1e090ec1ab04e10e3ce89a14c648d6ebb574cd81e498a22fd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.0/fountain-linux-arm64"
      sha256 "36b7ea920ac5612743c817defa5f63069e19313356d1f68a945801c48b6c5a65"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.0/fountain-linux-amd64"
      sha256 "7f65cda9c7d72451d9d4501bb9f6433196b8fcd82b00f74a3afc59db8be0d6f2"
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
