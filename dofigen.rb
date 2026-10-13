class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.9.0"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "6b8182c16593c3a825dd924a26914fbca979f30df9d5f670a23882c3e621ada9"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "7705b4e5e82e665b0cdddc7b06d701c272c516829b33a28b7f64d659d44493b4"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "c17e285f0227a70dc2b960693f4b360f139b9a82e436d3452edf0ed5ea420b05"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "a6871210b879fe5aa38ee894fefeab1adfc80783cdb5968053d6e22ab35cbd7e"
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