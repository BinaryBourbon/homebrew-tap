class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.2/fountain-darwin-arm64"
      sha256 "490719c8b660ff1b539783e5378f8750acd8cb06a092c644f002ad14555c9023"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.2/fountain-darwin-amd64"
      sha256 "1650a5e2cbd6a7069b77b6e66fde986a6e81111093fb8a9a0c6354aff95bdd1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.2/fountain-linux-arm64"
      sha256 "1854db2be83b1dad4f002928aecf3d3ab718f1d356cf7433892ed987ed2e07f1"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.10.2/fountain-linux-amd64"
      sha256 "52ce81b6eb4aa31fe1bcc224ff32ea90646364227f9b3b4fd4a65936ae055803"
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
