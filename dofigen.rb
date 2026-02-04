class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.7.0"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "16d075d30acaf5b4c6c90252c97cbf17bca3025271b4108b07bda289b6fc5521"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "05ebbaab6279f61e3e77b91544a08a566f51e598b2a3559cc5daa3e9d544a111"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "1c86d0e4e0ba4c8f06e48a1aa62dc40d181ac4dd52cad078b44a2571f65edb1f"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "a36d4a1c9a7d33b053e5e70bca290ef3ea95cb5a2e103caae0c8a0df6c0922ad"
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
