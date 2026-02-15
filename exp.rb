# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.4/exp_0.3.4_darwin_arm64.tar.gz"
      sha256 "a9abe4a80d57bada80f888f28b1f674ea9fe00f990aca2bcc67fd23f62fc47d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.4/exp_0.3.4_darwin_x64.tar.gz"
      sha256 "90d5b14403b38953ee6c04e7dce81bcb667a23ffac5d0deb26ea93a351200d48"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
