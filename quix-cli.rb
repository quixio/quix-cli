class QuixCli < Formula
    desc "Quix CLI"
    homepage "https://github.com/quixio/quix-cli"
    version "latest" # Or specify a specific version if desired
    license "MIT"
  
    # Define the URLs for the binaries based on architecture
    if Hardware::CPU.intel?
      url "https://github.com/quixio/quix-cli/releases/latest/download/osx-x64.tar.gz"
      sha256 "b966d3db258866183ddd9002ca910ddbd9af7460c82f3fb7c2e057ae96fc5ffb"
    elsif Hardware::CPU.arm?
      url "https://github.com/quixio/quix-cli/releases/latest/download/osx-arm64.tar.gz"
      sha256 "60739eb440654b226ec5ccfb1da953693d8a8ee5e1a71b32ed1f717c6e82709e"
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
  