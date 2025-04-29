class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.4.1"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "b58ba5ceed7492cbb7f9048286ea9b5cbae2bfb9a0eb2aeed98c1ebef184774d"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "e930a3d82454a8eb6006c128f666746d050f28895f334060b83a4822f57ad482"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "0f01cb62dcc1fa89cba9a9dcabc8b2842acea343e8e977086500e0ed45199e97"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "0a7534065a792b320dd4e29b5f7bbc29116ddd3b6f9c36c1f2fc92144d421c70"
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