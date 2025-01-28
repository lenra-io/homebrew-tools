class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "a32d7f8395bda856d97e4943e6dcbe3e38f607f23d7f41f6fe13e78561500b8f"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "a55395cb54efda54d37eae80b10846701247625397552c7d61f783b2fba81308"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "a2e11ef32f03412ff2b422db06be4b3eb75d0958774daffd46099b4eda0b2a62"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "18d860afec1b84b60989e6a4bf60a4a1afbd4aaa2d67805a7f45169e38c4e3ba"
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