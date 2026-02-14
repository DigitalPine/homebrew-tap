# typed: false
# frozen_string_literal: true

class Exp < Formula
  desc "Instant project forking via macOS APFS clonefile"
  homepage "https://github.com/thebrubaker/exp"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.3/exp_0.3.3_darwin_arm64.tar.gz"
      sha256 "a1b09ad86dabac77ee299f7a59aa8bf02096cd80d8093819397b6df99605791b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/thebrubaker/exp/releases/download/v0.3.3/exp_0.3.3_darwin_x64.tar.gz"
      sha256 "4e9ecfa77d78542bf909010c6a93d9d99e965183bb7c579c3fdf813918011386"
    end
  end

  def install
    bin.install "exp"
  end

  test do
    system bin/"exp", "--version"
  end
end
