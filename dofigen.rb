class Dofigen < Formula
  desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
  homepage "https://github.com/lenra-io/dofigen"
  version "2.4.0"

  on_macos do
      on_arm do
          @@file_name = "dofigen-macos-aarch64"
          sha256 "32771e99ebe847df31bc906a5a603934b654cd36aba5b0abf5bcf263ece8f481"
      end
      on_intel do
          @@file_name = "dofigen-macos-x86_64"
          sha256 "21d5218f9b64a6d14fd81f3b73186e0cd4f39e264807542339bc7a0364806e7f"
      end
  end
  on_linux do
      on_arm do
          @@file_name = "dofigen-linux-aarch64"
          sha256 "87cecf01ec1d818bb531a016cfa5bf854894eaeafe016becd8ad87e2a24db0a1"
      end
      on_intel do
          @@file_name = "dofigen-linux-x86_64"
          sha256 "634c8a9ff9c5b4591b068859c6a22ee4f274e368899b7e2de7adb2f6c863b1c9"
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