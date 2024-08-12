class QuixCli < Formula
    desc "Quix CLI tool"
    homepage "https://github.com/quixio/quix-cli"
    url "https://github.com/spkis/quix-cli/raw/main/install.sh"
    version "0.1.0"
    sha256 "216c5888bacef04f9af38a209616004ddde41c5c50a5507dfff75a6279412780"
  
    def install
        # Use the prefix provided by Homebrew
        system "bash", "install.sh", "--prefix=#{HOMEBREW_PREFIX}"
      end
    
      def caveats
        <<~EOS
          Quix CLI has been installed in #{HOMEBREW_PREFIX}/bin.
          You can run it with the command 'quix'.
        EOS
      end
    
      test do
        system "#{bin}/quix", "--version"
      end
    end