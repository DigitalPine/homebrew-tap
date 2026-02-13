# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant experiment forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.1/exp_0.3.1_darwin_arm64.tar.gz"
      sha256 "733f1ee31f60065c7f27494351fa5e483afec7d6fefa0a9c22356785a40a9ffa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.1/exp_0.3.1_darwin_x64.tar.gz"
      sha256 "3541b2c8a7f9df06477dbb5313cb91a483d6601fce94be3af60d2975b57c63ef"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
