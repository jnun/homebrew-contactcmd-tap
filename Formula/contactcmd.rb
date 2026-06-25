class Contactcmd < Formula
  desc "Personal CRM for the command line"
  homepage "https://contactcmd.com"
  version "0.2.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jnun/homebrew-contactcmd-tap/releases/download/v#{version}/contactcmd-#{version}-darwin-arm64.tar.gz"
      sha256 "d9416369136a24214ea927bd66b915a1a1975aca28dd034fb57455b468a838e5"
    elsif Hardware::CPU.intel?
      url "https://github.com/jnun/homebrew-contactcmd-tap/releases/download/v#{version}/contactcmd-#{version}-darwin-amd64.tar.gz"
      sha256 "4f017c9e9f3333178006a396241c58b8c96866140a736f74c4820c50007a396e"
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
        System Settings > Privacy & Security > Full Disk Access (for iMessage history)

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
