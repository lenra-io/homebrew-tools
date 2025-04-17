class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.3.3"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "dda9e74fa107ac793a2db936e189c4e1218bbfd875f59a516f67e80a20130fee"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "a64c47a820fe45eae2d085b91bb2a2bd7c94d1d613ac59c320d4ee03ba1d2e8e"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "bafa246169f50fb1e0689fc37afa15e5c9fddc78bbe1cb22d08366853efe0cbe"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "034a3f6dd642dd5022e2e5e36393fa133441ed63a3d3aeca11f94876d6875f0e"
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