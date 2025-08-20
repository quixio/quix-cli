class QuixCli < Formula
    desc "Quix CLI"
    homepage "https://github.com/quixio/quix-cli"
    version "1.4.2" # Or specify a specific version if desired
    license "MIT"
  
    # Define the URLs for the binaries based on architecture
    if Hardware::CPU.intel?
      url "https://github.com/quixio/quix-cli/releases/download/1.4.2/osx-x64.tar.gz"
      sha256 "b668dea36e781ac1f5c5abbe992a671d27a43a91d398b8177e35f6c219c43cec"
    elsif Hardware::CPU.arm?
      url "https://github.com/quixio/quix-cli/releases/download/1.4.2/osx-arm64.tar.gz"
      sha256 "60212915acd2a79d5d2a50245d00c2b76f99faec913b66012e92adb4db47ed69"
    else
      odie "Unsupported architecture"
    end
  
    def install
      bin.install "quix" # Installs the binary into the Homebrew bin folder
    end
  
    def post_install
      # Any post-installation actions like signing the binary
      if OS.mac?
        system "codesign", "-s", "-", "#{bin}/quix"
      end
    end
  
    test do
      # Basic test to verify installation
      system "#{bin}/quix", "--version"
    end
  end
  
