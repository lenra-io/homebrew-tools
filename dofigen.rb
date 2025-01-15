class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "517aaf1701539f38b5ef720e53b4f6126cbc0461c55c88de837e657fc7731e5d"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "cba92a16f3f6cee6908304b2c6c5770f7b7c00150cf86a29fa353c57bfa0781f"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "59210570e26e2c51e9f3e876e42d7dc96419c7011bb1e8aead5813fae16a021d"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "4af3ce902bca94eb9eea696a565dde4429989558a58daed49aa72d14fade9957"
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