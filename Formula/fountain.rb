class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.16.0/fountain-darwin-arm64"
      sha256 "05ea8d0d849b14e89c65cdfb8d2e0067ea235f3e5afeaebf33868e640de3cfc9"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.16.0/fountain-darwin-amd64"
      sha256 "422ed69fe466a59cde51707486e5a2220f51687914a0d8816d5c7ad33fa014b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.16.0/fountain-linux-arm64"
      sha256 "2041310881b466cace4177f722ed861de103d5c3f1e0ab16abd55110f9f7d1bc"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.16.0/fountain-linux-amd64"
      sha256 "e27bdd10cbbde289900eaa56bff310167fa1ce7524bb0dc95239d8ba3274d805"
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
