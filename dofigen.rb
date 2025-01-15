class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version ""

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "3916e8fa80a69624d7e1de0c9bf359d4dd64be60f3c2dea989c3013042055764"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "06650ad9b950da80e3c1078f6b6fafbc9284aa8242ab91139b1e5ddb3dca2bd5"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "ca5ccabd26b2c43ebc9b9ad9eecb9415ab3225101fe7ef6ca524e11f75e2ce01"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "181b67e8ddd7b6633e9f4ceb298bb821649eb63e077eba3083d2a412dcf63bbb"
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