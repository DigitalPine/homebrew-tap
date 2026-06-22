# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.14.0/exp_0.14.0_darwin_arm64.tar.gz"
      sha256 "a12a8e16ef4eb5a4fc26c4d7cbe91300a969523a39a44664692e6b9634ad5799"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.14.0/exp_0.14.0_darwin_x64.tar.gz"
      sha256 "277d0c86bbf5ab809885abc5fb03f99c54965e435195dc7941d55db887794af3"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
