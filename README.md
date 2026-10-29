# homebrew-tap

Homebrew casks for my Mac apps.

## [Touch My Bar](https://github.com/jdmry/touch-my-bar)

Replaces the Touch Bar with a dock and system controls.

```sh
brew tap jdmry/tap
brew trust jdmry/tap
brew install --cask touch-my-bar
xattr -dr com.apple.quarantine "/Applications/Touch My Bar.app"
```

Two of those steps are unusual and worth understanding before you run them.

`brew trust` — Homebrew will not load casks from a third-party tap until
you say you trust it. That is Homebrew asking whether you trust me, and it
is a fair question to stop and think about.

`xattr -dr com.apple.quarantine` — the app is not notarized by Apple, so
Gatekeeper refuses to open it. Removing the attribute is how you override
that. It means trusting this build without Apple having checked it. The
source is public, and `./Scripts/make-app.sh` builds it yourself if you
would rather not take my word for it.

Homebrew used to offer `--no-quarantine` for this; it was removed in
Homebrew 7, so the attribute has to come off afterwards.
