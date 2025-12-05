class How < Formula
  desc "Natural Language to Shell Command Translator"
  homepage "https://github.com/hansbala/how"
  
  # --------------- Updates for each release ---------------
  current_version = "0.1.1"
  mac_sha         = "6331ed02f7e8165f97317f52531c741e2059c9f16e795e2a1c4350eb5ef4c1a8"
  linux_sha       = "d0b02a5f752f8dbb6ed0b2f260e5debf39ff27358da94888f09ce101a6927d55"
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

