class How < Formula
  desc "Natural Language to Shell Command Translator"
  homepage "https://github.com/hansbala/how"
  
  # --------------- Updates for each release ---------------
  current_version = "0.1.1"
  mac_sha         = "SHA256_OF_MAC_BINARY"
  linux_sha       = "SHA256_OF_LINUX_BINARY"
  # --------------------------------------------------------

  version current_version

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hansbala/how/releases/download/v#{current_version}/how-darwin-arm64"
      sha256 mac_sha
    else
      odie "This tool only supports Apple Silicon (aarch64)."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hansbala/how/releases/download/v#{current_version}/how-linux-amd64"
      sha256 linux_sha
    end
  end

  def install
    if OS.mac?
      bin.install "how-darwin-arm64" => "how"
    elsif OS.linux?
      bin.install "how-linux-amd64" => "how"
    end
  end
end

