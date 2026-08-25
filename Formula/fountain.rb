class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.14.0/fountain-darwin-arm64"
      sha256 "5fb8d945bb83f4c34983e726a6e275590e5afcc1fc837859c2284296b24efca7"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.14.0/fountain-darwin-amd64"
      sha256 "c9a399d4250f513f90d216360400d7b3bc446a3b2489fc13966a60c499b9b4d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.14.0/fountain-linux-arm64"
      sha256 "80f31a13ebc5579e616076cc0dfe26aec4123b4251eb265d4ad92030255b4b8d"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.14.0/fountain-linux-amd64"
      sha256 "4f6c084b42839971c8c8dd60c527ea6a0c3368beae832da1d6ba24a8de5aa3c3"
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
