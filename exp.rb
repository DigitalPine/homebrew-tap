# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.2/exp_0.3.2_darwin_arm64.tar.gz"
      sha256 "b5ecbcf02ae03c32a677822c9faf570bcf28f86697d7d53e3da7925e8a4ca303"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.2/exp_0.3.2_darwin_x64.tar.gz"
      sha256 "94f9e6f956758b1be34e60a9f8204085dcdab9a43971735a9037358747ec2e51"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
