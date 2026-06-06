# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.11.0/exp_0.11.0_darwin_arm64.tar.gz"
      sha256 "7c9cf8b44e0c84bf505774d9a9cff4eb027c68418a6f903d25a4d137bd1010cc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.11.0/exp_0.11.0_darwin_x64.tar.gz"
      sha256 "27e7d96f29e6ab0e5ab8576a1d213effab636eaaf352c1f336339a1768a7d047"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
