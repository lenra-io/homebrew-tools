class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "6a904b96ad0e1bd45b7f5794a495ba1a5eb088c13983c1c483f65d14719e2b60"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "25fea03959bb501b8e9a9d35e2d4438a4e33afaced05f22e0d259862e1afc0af"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "42f52dd384b6aa713cb160ba2e89cbe6afd076fb16b7eab063ccac8e0570a4cb"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "73cee810de0bb8886fc9d219637fbe1025e9e3394f814874e165f290c4752034"
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