class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "4a0ba2e9d7721df7add69c2321b2c3fd35e852952b0869ffb0e805198f367893"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "a911d6bc9ef1af59dbd68764872fee4464304722b077841db35c57c6f2234e81"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "ae9bcdf7faecd6d0a2e7ec4a74f944076e1ee8e0fe992269cae6356951edd950"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "9f608cae414cf44ff5855c3d0a447f03d933fdb813cfe25c60bc07dca972bde8"
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