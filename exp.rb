# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.12.0/exp_0.12.0_darwin_arm64.tar.gz"
      sha256 "45275adb80da52d303015460eb7baf191603d0531c5a0a0a1d51c4bbf3cd2537"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.12.0/exp_0.12.0_darwin_x64.tar.gz"
      sha256 "e6b9ebec4ae074890160c0d5e498b4718174a17335071e5fd6c79453c6657fab"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
