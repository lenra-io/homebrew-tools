class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.3.1"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "551a706934cfc76e4068bdf562a3a3d83f44d2b67a314e77a55dc43b4ca4418f"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "ec6326a24f7f7523fa9dc9329e1e5081597d1f6835d9afd04b3da1d981f667fc"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "0813b6233b73ac67664e35663f1b99b298582eddcb03328a28b0840f01e8ee48"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "7c59dd39bac43bd06029cc27b279752652d108c7c227d3b08f7e611a5e72091f"
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