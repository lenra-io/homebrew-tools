class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.8.0"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "4f358edc8ff82aa0c6c876e296b0ca3e50016e501bf59f682b96ab9ee279ff8d"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "9f70b49a3b0ae0d9cf5a02c1c073b56b6d32611abcf42d2e54a80319450d971a"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "1f43df28b9497eda9273c9adfcf3937e7061baac7da0e519b3c80a11a9163717"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "2f2a66edc5445cbc40b474ea6efee8e95c4283403bf34e94cad24bc12274005f"
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
