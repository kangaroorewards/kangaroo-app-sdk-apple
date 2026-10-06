// swift-tools-version:5.9
import PackageDescription

// NOTE: This manifest has no releases yet. `url` and `checksum` below are
// placeholders and MUST be replaced by the automated release process (or
// manually, as a fallback) the first time a real XCFramework is published.
// See README.md for how versions here are produced and verified.
let package = Package(
    name: "KangarooAppSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(name: "KangarooAppSdkCustomer", targets: ["KangarooAppSdkCustomer"]),
        .library(name: "KangarooAppSdkBusiness", targets: ["KangarooAppSdkBusiness"]),
    ],
    targets: [
        .binaryTarget(
            name: "KangarooAppSdkCustomer",
            url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple/releases/download/PLACEHOLDER/KangarooAppSdkCustomer.xcframework.zip",
            checksum: "0000000000000000000000000000000000000000000000000000000000000000"
        ),
        .binaryTarget(
            name: "KangarooAppSdkBusiness",
            url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple/releases/download/PLACEHOLDER/KangarooAppSdkBusiness.xcframework.zip",
            checksum: "0000000000000000000000000000000000000000000000000000000000000000"
        ),
    ]
)
