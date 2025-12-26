class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.6.1"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "fe07a996a2988dfd0ed95e06408d58da461834b8aa2cccb10492a33f9bb23021"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "b22564b978e18a56728c9315279d9c4f314c37fe6db3e94fc2e475095c02ed8a"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "a4cdf1aa4862865ed7fc86bb855a8bc62636e68758ba4e3ea1ce25c975ec722c"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "1ab034507024a66027f7a39e8e7bd29fa74cf03e3e4c5dee7e871494de8cd03d"
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