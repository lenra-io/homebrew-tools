class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "58f633a5817c915104e96ed5abaa40aedca4395669b93e5669ff74ff89f9032b"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "b014eec1d3a8c246a2443d083306b39ba63fca463c7a00c1d137f2a601b02b25"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "4f07dad21bd09025ea97a566bfaacefdd796ebf57c9cbce16e123fbee9b5b24c"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "0fe1d44148155f5bde44a4e34dd91011083804b09dc0c8367baf548e20883396"
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