class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.3.2"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "4012dbde684b268af3224a7eb8b33655da6307f01d4dac822acf1d935aa17030"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "bbbe9a5bdb101d34c4c78733617c446f8f143bcf18c09e2a86ea57f7c78f4f35"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "dd2e13ad2b5247598edd3e032b0a6c72694c935cb52b7b30c94a0d55ab60495d"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "0d930c2b2be597cd0985419f7b8b3c222d5e1155e8d766d013d06e459cbbdcd9"
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