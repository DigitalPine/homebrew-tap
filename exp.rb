# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.4.0/exp_0.4.0_darwin_arm64.tar.gz"
      sha256 "ea6ee15106d87c85526632878e6d524208ba10f71d72d0c918d9905a16e6340a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.4.0/exp_0.4.0_darwin_x64.tar.gz"
      sha256 "cb3101336da8f296442721c609889306328bffba86a7fb6b10bfc251a7c18cfb"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
