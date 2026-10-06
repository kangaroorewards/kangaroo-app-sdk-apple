// swift-tools-version:5.9
import PackageDescription

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
            url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple/releases/download/v1.1.1/KangarooAppSdkCustomer.xcframework.zip",
            checksum: "3ed874762e20efce238fd93c1bb994e86b5685839a3368bf39857ce1ca646f8f"
        ),
        .binaryTarget(
            name: "KangarooAppSdkBusiness",
            url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple/releases/download/v1.1.1/KangarooAppSdkBusiness.xcframework.zip",
            checksum: "920f1850e49facf8c7b1edb28908e435ca9763ce6df9e5a7f2ca7a966f9b6f5e"
        ),
    ]
)
