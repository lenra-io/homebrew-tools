class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.5.0"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "39b86a110644b170963a338646b6d37353fe3df90a40f01a892c472d815bc328"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "cf6e0622793f54714df77db846c48e1a4b6bad96b284479146927cfeb2ebd880"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "32e893f0930e9e557deeaa9a296d0349d7e0a09e3efc6d662f1c302311e868bf"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "0d06db545483368e709e45e50c4a978d96f85fee3b01bf7e0fcab66d1dc890bb"
      end
  end

  url "https://github.com/lenra-io/dofigen/releases/download/v#{version}/#{@@file_name}"

  def install
    bin.install "#{@@file_name}" => "dofigen"
  end
  test do
    system "#{bin}/dofigen  --version"
    expected_version = "dofigen #{self.version}"
    actual_version = shell_output("#{bin}/dofigen --version").strip
    assert_match expected_version, actual_version
  end
end