cask "windowclip" do
  version "0.3.0"
  sha256 "c002d282e8f1ffe8db01ddc3c943c99657d194553ab638a273aec82ae82cca80"

  url "https://github.com/thebrubaker/windowclip/releases/download/v#{version}/Windowclip.dmg"
  name "Windowclip"
  desc "Record a single window and render it into a polished MP4"
  homepage "https://github.com/thebrubaker/windowclip"

  # Bare version symbol means ">=" — Homebrew's MacOSRequirement.parse routes a
  # plain symbol through the >= comparator. Every binary in the bundle is built
  # against a macOS 15 deployment target, and the recorder's background uses
  # SwiftUI MeshGradient, which is Sequoia-only. Declaring the floor here makes
  # Homebrew refuse the install rather than hand over an app whose recorder dies
  # with a dyld error the first time you press record.
  depends_on macos: :sequoia

  app "Windowclip.app"

  # Renamed from the "stage-studio" cask on 2026-07-30. The bundle identifier
  # moved with the name, so macOS treats this as a new app: it asks for its own
  # Screen Recording and Microphone grants and keeps its own Application Support
  # directory. The old app is not upgraded in place and is left for the user to
  # remove deliberately.
  zap trash: [
    "~/Library/Application Support/Windowclip",
    "~/Library/Preferences/io.digitalpine.windowclip.plist",
  ]

  caveats <<~EOS
    Windowclip needs Screen Recording and Microphone access. Launch it and it
    will walk you through granting both — macOS requires a relaunch after Screen
    Recording is granted, and the app offers that as a button.

    Press ⌥⌘R to record a window, or use "Record a Window…" in the menu bar icon
    if that shortcut is already taken on your Mac.

    Upgrading from Stage Studio? It is a separate app with its own permissions.
    Once Windowclip is working you can remove the old one:
      brew uninstall --cask stage-studio
      rm -rf ~/Library/Application\\ Support/Stage\\ Studio
  EOS
end
