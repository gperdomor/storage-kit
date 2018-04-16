// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "storage-kit",
    products: [
        .library(
            name: "storage-kit",
            targets: ["StorageKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "StorageKit",
            dependencies: []),
        .testTarget(
            name: "StorageKitTests",
            dependencies: ["StorageKit"]),
    ]
)
