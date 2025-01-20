class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "8dec1aa85b21d9256538bc5a910c33764f14597eb4fd5380f5dbf2d72eda53cf"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "f0d9703e087088c288d6f6841f24e12190f987e22573a279b0e507db2e077113"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "5b880b2b08930696c2deeb2ac56f6f4a06db23a3c13ededf96fb9d1c4ea983e5"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "40ee5cf1748b49abd3cbb420d1ce8ff206bfe8b9e6599dde39f7ebad9e7bafbb"
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