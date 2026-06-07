# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.13.0/exp_0.13.0_darwin_arm64.tar.gz"
      sha256 "49f668f3dbf4b552f81d0cbfc53258fad54936f7dbac7275a3ed7d3a52fb040d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.13.0/exp_0.13.0_darwin_x64.tar.gz"
      sha256 "b7077d1db710db8dbae8af1981fc6ee1fa343a11f2e4e2741250d0b732a3158d"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
