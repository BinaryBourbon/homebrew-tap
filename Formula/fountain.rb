class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.2/fountain-darwin-arm64"
      sha256 "916e0ac576eeef03bf90eccf03df83a55ddfe511ab8dd3814989b76f633627e1"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.2/fountain-darwin-amd64"
      sha256 "059b880f748db6ac6cdcfc364d4e54768c2aece4276b701699bf09724162a825"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.2/fountain-linux-arm64"
      sha256 "c0d0ea3da07eb30bfbec76013f3441c3bb422c8eba60a103e90e80ff4ba6ce78"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.5.2/fountain-linux-amd64"
      sha256 "e986b5a07b0ff53ba60c3b7cd44962fa8740379e03745214520b56aea70312df"
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
