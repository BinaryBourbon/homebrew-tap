class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.3.0/fountain-darwin-arm64"
      sha256 "bc13c978acd8ffd2531d43b7b00112a8ed3ed22d11fb06f64875d02505c53cb7"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.3.0/fountain-darwin-amd64"
      sha256 "3b60701530cadf8833ba1e0122dfcf91332e0c99c9d058d40361d9236f44a198"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.3.0/fountain-linux-arm64"
      sha256 "e026911749a31f84af8a9935e7b97169fdd883d06099c002bc29284fbff2d21a"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.3.0/fountain-linux-amd64"
      sha256 "318101423df87179d81f6fdfa1d29e708d8eee7218b42145bb1bb2c4ac59146a"
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
