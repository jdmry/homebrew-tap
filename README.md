# homebrew-tap

Homebrew casks for my Mac apps.

```sh
brew tap jdmry/tap
```

## Casks

### [Touch My Bar](https://github.com/jdmry/touch-my-bar)

Replaces the Touch Bar with a dock and system controls.

```sh
brew install --cask --no-quarantine touch-my-bar
```

`--no-quarantine` is required: the app is not notarized, so Gatekeeper
would otherwise refuse to open it. Installing this way means trusting the
build without Apple having checked it — the source is public if you would
rather read it, or build it yourself.
