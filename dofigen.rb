class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.6.0"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "3bb7da22a1d959bc5e63c69ef31bdffdba2286f2ba476e82268cd47fb7a4c177"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "30e367cb51579b9333000e1d5314f10b58c5db30ef978e0daa2451601b39c22c"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "aef82884a16cb6724d33202d8d4fc030fc7bae0f2e016e84576d0671030148e5"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "410c4c2f24775063cdd3b8ed5d8f3903eb5e52e69661788780a10ad9289f5a1d"
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