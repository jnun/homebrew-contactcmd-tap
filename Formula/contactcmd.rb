class Contactcmd < Formula
  desc "Personal CRM for the command line"
  homepage "https://contactcmd.com"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jnun/homebrew-contactcmd-tap/releases/download/v#{version}/contactcmd-#{version}-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_ARM64_SHA256"
    elsif Hardware::CPU.intel?
      url "https://github.com/jnun/homebrew-contactcmd-tap/releases/download/v#{version}/contactcmd-#{version}-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_AMD64_SHA256"
    end
  end

  depends_on :macos

  def install
    bin.install "contactcmd"
  end

  def caveats
    <<~EOS
      ContactCMD needs access to macOS Contacts.

      Grant permissions in:
        System Settings > Privacy & Security > Contacts

      Quick start:
        contactcmd sync mac     # Import your contacts
        contactcmd list         # Browse contacts
        contactcmd nudges       # See who needs attention
    EOS
  end

  test do
    assert_match "contactcmd", shell_output("#{bin}/contactcmd --help")
  end
end
