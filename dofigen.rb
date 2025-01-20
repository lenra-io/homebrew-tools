class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "1fda8f6e8723bc519e6114acd07f64d1de720916a8ce1c6dfbed00a5646ccf1c"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "15722a103cd3f789c8adb4c00a0dc20546fd27e6ae218bf79741a22b587b8aba"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "8a56498612d52220b1778a38fedaaa13e016eeed6c2f439b09c229f75f055e14"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "fcaa05b5ff8e49892efc4eedbbe7f3b0dddaee1a6cf11a447b399b754a79e6ab"
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