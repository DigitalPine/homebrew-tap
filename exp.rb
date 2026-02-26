# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.6.0/exp_0.6.0_darwin_arm64.tar.gz"
      sha256 "99c3251059a91e29446e44be1ffe297ebe5051f7f471aaefb3a6663fe3ee715e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.6.0/exp_0.6.0_darwin_x64.tar.gz"
      sha256 "2fce3d6eda95dc822c16a756df62d052dfbda709c48b5b257b24538524a247df"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
