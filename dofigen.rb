class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.3.0"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "cba8e5a18e47d8d15f82e218deacc6e5f8d07485da98790a8573bc73e3ecfcdf"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "a771d2521a29b4b6858b168d5f877d5c2ea9a51c44bed87bb09fc0e11edb2080"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "66a1e51d06bc07db853523e0700991c49e61a1be20d8684e535e5734b44f8575"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "8796c5859c15af8f400cf2020cdf8c4c9d283515ded539a5cdf8be3f339629fe"
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