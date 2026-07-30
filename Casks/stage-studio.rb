cask "stage-studio" do
  version "0.2.0"
  sha256 "d85f3f10bec72870c581ba1727934fe28f733e52130737eaf56343d12ced5a87"

  url "https://github.com/thebrubaker/stage-studio/releases/download/v#{version}/Stage-Studio.dmg"
  name "Stage Studio"
  desc "Record a window and render it into a polished MP4"
  homepage "https://github.com/thebrubaker/stage-studio"

  # The recorder draws its background with SwiftUI MeshGradient, which is
  # Sequoia-only, and every binary in the bundle is built against a macOS 15
  # deployment target. Declaring it here makes Homebrew refuse the install on
  # an older Mac rather than hand over an app whose engine dies with a dyld
  # error the first time you press record.
  # Bare symbol means "at least" — Homebrew's MacOSRequirement.parse routes a
  # plain version symbol through the >= comparator, and deprecated the older
  # ">= :sequoia" string form in favour of exactly this.
  depends_on macos: :sequoia

  app "Stage Studio.app"

  zap trash: [
    "~/Library/Application Support/Stage Studio",
    "~/Library/Preferences/io.digitalpine.stage-studio.plist",
  ]

  caveats <<~EOS
    Stage Studio needs Screen Recording and Microphone access. Launch it and
    it will walk you through granting both — macOS requires a relaunch after
    Screen Recording is granted, and the app offers that as a button.

    Press ⌥⌘R to record a window, or use "Record a Window…" in the menu bar
    icon if that shortcut is already taken on your Mac.
  EOS
end
