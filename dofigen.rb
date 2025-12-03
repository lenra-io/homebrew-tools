class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.5.2"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "b07eb911b529743e38f900c248c396652f54a9546713aad0b1888610b8636bba"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "9938eed9c555bc14ec1aac83fcdd66ba1c027f9e49bd8c063dd2335f36b5433a"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "b6d644ca53f937fcff1e1dc1904bfb7c5db7528255beb4fabf678f12d3b6bcd3"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "06f6746a3f9e4490dac506d7981f9a7dae9e53ed5f47d6e9095a5c1fc77926a2"
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