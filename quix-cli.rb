class QuixCli < Formula
    desc "Quix CLI tool"
    homepage "https://github.com/quixio/quix-cli"
    url "https://github.com/quixio/quix-cli/raw/main/install.sh"
    version "0.1.0"
    sha256 "216c5888bacef04f9af38a209616004ddde41c5c50a5507dfff75a6279412780"
  
    def install
        # Specify the local installation directory
        local_bin = "#{ENV['HOME']}/.local/bin"
        system "mkdir", "-p", local_bin
        system "bash", "install.sh", "--", "--prefix=#{local_bin}"
      end
    
      def caveats
        <<~EOS
          Quix CLI has been installed in your local bin directory: ~/.local/bin.
          To use it, you may need to add the following to your shell configuration:
          
          export PATH="$HOME/.local/bin:$PATH"
        EOS
      end
    
      test do
        system "#{ENV['HOME']}/.local/bin/quix", "--version"
      end
    end