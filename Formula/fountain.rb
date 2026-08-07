class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/BinaryBourbon/fountain"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.7.0/fountain-darwin-arm64"
      sha256 "4d6db72ac89c757ef668536d95b12c683748c22f4350e4c41e03e73192460fe6"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.7.0/fountain-darwin-amd64"
      sha256 "a9ec4aa8834d6766eadb46ccb6985e2e0560f03b9c82e1f9a4845561c1564e32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.7.0/fountain-linux-arm64"
      sha256 "a8c94b69c42c69b036452112ab25f30a1a9db1a1a5b42f72e43c93d260b3adbc"
    end
    on_intel do
      url "https://github.com/BinaryBourbon/fountain/releases/download/v0.7.0/fountain-linux-amd64"
      sha256 "034b32c39cc8d1190babdf691aef12035544662ee7c776a9c00277d4d6a26585"
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
