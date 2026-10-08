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

    ],
    targets: [
        .binaryTarget(
            name: "KangarooAppSdkCustomer",
            url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple/releases/download/v1.1.3/KangarooAppSdkCustomer.xcframework.zip",
            checksum: "89a1948ddec6048ef43bca2042ebc7e12bf7a98732ea1618785a873c1f3760e4"
        ),
]
)
