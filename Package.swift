// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "StorageKit",
    products: [
        .library(name: "StorageKit", targets: ["StorageKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc")
    ],
    targets: [
        .target(name: "StorageKit", dependencies: ["Vapor"]),
        .testTarget(name: "StorageKitTests", dependencies: ["StorageKit"])
    ]
)
