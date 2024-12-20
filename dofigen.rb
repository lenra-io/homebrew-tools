class Dofigen < Formula
	desc "Dofigen is a Dockerfile generator using a simplified description in YAML or JSON format"
	homepage "https://github.com/lenra-io/dofigen"
	version "2.2.0"
	# on_macos do
	# 		on_arm do
	# 				url "https://github.com/lenra-io/dofigen/releases/download/v2.2.0/dofigen-macos-aarch64"
	# 				sha256 "ecb153b45ea3a5419b5d4e42f52f7eb64cb8eb52621e53d5230761abb4891bda"
	# 		end
	# 		on_intel do
	# 				url "https://github.com/lenra-io/dofigen/releases/download/v2.2.0/dofigen-macos-x86_64"
	# 				sha256 "c9568ee08a4ef5c0bf94045b3133beeafa9ec222ac280d7859b18c2964e55451"
	# 		end
	# end
	on_linux do
			on_intel do
					url "https://github.com/lenra-io/dofigen/releases/download/v2.2.0/dofigen-linux-x86_64"
					sha256 "a66f03379a47c944abec8c4b3a391e6ff62cd175d65a852bec0365931b2ec73a"
			end
	end

	def install
			bin.install "dofigen-linux-x86_64" => "dofigen"
	end
end