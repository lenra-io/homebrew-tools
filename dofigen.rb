class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.5.1"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "093da739b3c82a98d2b8971751735be5bb0bd185b5d555d974d015a81a959011"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "37ecd9ae0fdc94d7cf94da2c7c15a5e5b854e5d93fa6d66b41df0c96279918f8"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "0c61c8b4f2e552f26a766046070e5d18cedfd99eaf6d9b4c7b556c6cc15277f1"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "a21f09450a05448300cb69f774d5953a1d62633c19113b5c1813c236bc1ad482"
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