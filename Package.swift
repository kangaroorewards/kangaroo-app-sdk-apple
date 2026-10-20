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
            url: "https://github.com/kangaroorewards/kangaroo-app-sdk-apple/releases/download/v1.1.4/KangarooAppSdkCustomer.xcframework.zip",
            checksum: "f8bc85aed380dd4d47737f464977cfea4ee63fe7c7eabc2756debfad2418d889"
        ),
]
)
