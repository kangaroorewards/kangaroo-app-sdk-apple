# Kangaroo App SDK — Apple (iOS/macOS) distribution

This repository is a **public distribution point only**. It does not contain
the Kangaroo App SDK's source code — that lives in the private
[`kangaroorewards/Kangaroo-App-SDK`](https://github.com/kangaroorewards/Kangaroo-App-SDK)
repository (Kotlin Multiplatform). This repo exists solely so that Swift
Package Manager (SPM) can fetch prebuilt, versioned XCFrameworks over a public
`Package.swift` manifest and GitHub Releases, without requiring consumers to
have access to the private source repository.

## Installing

Add this package in Xcode via **File → Add Package Dependencies…** and enter:

```
https://github.com/kangaroorewards/kangaroo-app-sdk-apple
```

Or in `Package.swift`:

```swift
.package(url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple", from: "1.1.1")
```

No version has been released yet. The manifest's download URLs and checksums
remain placeholders until the first automated release; the installation example
above assumes the suggested first tag, `v1.1.1`, has been published.

The release frameworks require **iOS 15+** or **macOS 12+**. They contain iOS
arm64 device, arm64/x86_64 simulator, and arm64/x86_64 macOS slices.

Two products are available:

- `KangarooAppSdkCustomer` — customer-facing API surface
- `KangarooAppSdkBusiness` — business-facing API surface

Both are core-only builds today. See the private SDK repository's
`docs/README.md` for the current scope of generated endpoint coverage.

## How a release gets here

Nothing is built or committed by hand in this repository. Each release is
produced by the private SDK repository's CI:

1. A tag (e.g. `v1.2.0`) is pushed on `kangaroorewards/Kangaroo-App-SDK`.
2. Its `apple` build job compiles and validates the `KangarooAppSdkCustomer`
   and `KangarooAppSdkBusiness` release XCFrameworks (iOS device + simulator,
   macOS) and zips them.
3. After API-generation, Android/web, Apple, and release-tooling checks all pass,
   a serialized publish step in that same CI run:
   - Validates both ZIPs, exported modules, platform slices and SHA-256 checksums.
   - Replaces exactly one URL and checksum per binary target in `Package.swift`.
   - Atomically pushes the manifest commit to `main` and creates the matching
     version tag **on that same commit**, without force-pushing.
   - Creates a draft GitHub Release using the existing tag, then uploads both ZIPs.
   - Downloads and checks the uploaded assets byte-for-byte, verifies the
     manifest fetched from the public tag, and only then publishes the draft.

Manual workflow dispatches and pull requests build and validate only; they never
publish. Stable tags must use canonical `vMAJOR.MINOR.PATCH` syntax and increase
monotonically. Existing version tags and release assets are never overwritten.
If publication fails after the atomic push, the tag (and possibly a draft)
remains for investigation; blindly rerunning is intentionally rejected. Verify
the recorded source and manifest commits and assets before completing that
draft manually, or publish a newer version. Never move an existing version tag.

No person manually copies binaries between repositories, and no artifacts are
committed to source control — only the generated `Package.swift` text
changes, and only through automation.

## Versioning

Release tags here track the private SDK repository's version numbers
one-to-one. A given tag's XCFrameworks were built from the matching tag in
the private repository.

## License

Apache License 2.0 — see [`LICENSE`](LICENSE). Copyright Mobicept Inc.
