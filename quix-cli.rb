class QuixCli < Formula
    desc "Quix CLI"
    homepage "https://github.com/quixio/quix-cli"
    version "1.6.1" # Or specify a specific version if desired
    license "MIT"
  
    # Define the URLs for the binaries based on architecture
    if Hardware::CPU.intel?
      url "https://github.com/quixio/quix-cli/releases/download/1.6.1/osx-x64.tar.gz"
      sha256 "b3d73e3c6461cbf57eab704fab4218a8b648021cd826d43f2107799682cddc47"
    elsif Hardware::CPU.arm?
      url "https://github.com/quixio/quix-cli/releases/download/1.6.1/osx-arm64.tar.gz"
      sha256 "d25b3970fd70ad3e25545366b2f3829be6f61cd99661317497af3a354e5d0e06"
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
  
