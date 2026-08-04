class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.0/fountain-darwin-arm64"
      sha256 "1276f02bf9fe733e616e44b85cbbc22697ece149efa813468203a3b0c0d710be"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.0/fountain-darwin-amd64"
      sha256 "37275d4c596e6e401629216510c139f0981b3d94f45bdce84dcb00bdc8ffe2e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.0/fountain-linux-arm64"
      sha256 "9d3c22312f38e80318f6984ca2825e4a980d648cf9644e30177f161a4c2360fa"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.4.0/fountain-linux-amd64"
      sha256 "6645e46ea81d0cf121c3f156da59dd1b6eda0eaf6dcbdee5cdccd35707978415"
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
