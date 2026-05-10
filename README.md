# BinaryBourbon Homebrew Tap

Homebrew formulas for BinaryBourbon CLIs.

## Install

```sh
brew tap BinaryBourbon/tap
brew install fountain
```

Upgrade:

```sh
brew update
brew upgrade fountain
```

## Formulas

- **fountain** — [source](https://github.com/BinaryBourbon/fountain). Pulls
  the prebuilt binary from the GitHub release matching the formula's
  `version`. Supports macOS (arm64, amd64) and Linux (arm64, amd64).

## Updating

`Formula/fountain.rb` is updated automatically by the
[Release workflow](https://github.com/BinaryBourbon/fountain/blob/main/.github/workflows/release.yml)
in the fountain repo whenever a new `v*.*.*` tag is pushed. The workflow
recomputes the SHA256 of each platform binary and pushes a commit to this
repo.

Manual edits should normally be unnecessary; if you make one, keep the
format compatible with the regex-based bumper in the release workflow.
