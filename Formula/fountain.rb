class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.0/fountain-darwin-arm64"
      sha256 "8a2ebdd0dc9a46eb7635bc5179a21bbd4fcc49f996c0d94dffa38650f2e441c8"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.0/fountain-darwin-amd64"
      sha256 "de819af034ed94f655f5bd62bb96fe0000deaefc1e82966563053ffb8ddb6971"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.0/fountain-linux-arm64"
      sha256 "4bf85b8804c91c09f1b546533d1eb5ee03de45a24e85c710d04352faca76f000"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.9.0/fountain-linux-amd64"
      sha256 "6a4885b7fc892076b17749a4a6055841442dbba239b66d723bb43b5c0937d417"
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
