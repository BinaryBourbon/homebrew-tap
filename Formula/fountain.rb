class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.1/fountain-darwin-arm64"
      sha256 "785efa0b9b03ab09937ddb6a3e26b4c33e9ff68b490ed1cd9bc29771a4268c4d"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.1/fountain-darwin-amd64"
      sha256 "e892876be59a2208f7746d9b769a80ca9ffdfc03d7241c23694dcdccce433958"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.1/fountain-linux-arm64"
      sha256 "42aac9965f533814df6f3862ff3a107ff5095b233d1641f8948cd4d8e776901c"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.1/fountain-linux-amd64"
      sha256 "f091492571e3a3fcd73704ce5900571563320fa0f9a9ec26d70b66a9926e7798"
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
