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
.package(url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple", from: "1.0.0")
```

Two products are available:

- `KangarooAppSdkCustomer` — customer-facing API surface
- `KangarooAppSdkBusiness` — business-facing API surface

Both are core-only builds today (see the private SDK repo's `AUTOMATION.md`
for the current scope of generated endpoint coverage).

## How a release gets here

Nothing is built or committed by hand in this repository. Each release is
produced by the private SDK repository's CI:

1. A tag (e.g. `v1.2.0`) is pushed on `kangaroorewards/Kangaroo-App-SDK`.
2. Its `apple` build job compiles and validates the `KangarooAppSdkCustomer`
   and `KangarooAppSdkBusiness` release XCFrameworks (iOS device + simulator,
   macOS) and zips them.
3. An automated publish step in that same CI run:
   - Computes the SHA-256 checksum of each zip.
   - Creates a matching GitHub Release **here**, uploading both zips as
     release assets.
   - Updates `Package.swift` in this repository with the new release's
     download URLs and checksums, and pushes that commit.

No person manually copies binaries between repositories, and no artifacts are
committed to source control — only the generated `Package.swift` text
changes, and only through automation.

## Versioning

Release tags here track the private SDK repository's version numbers
one-to-one. A given tag's XCFrameworks were built from the matching tag in
the private repository.

## License

Apache License 2.0 — see [`LICENSE`](LICENSE). Copyright Mobicept Inc.
