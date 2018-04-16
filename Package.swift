// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "StorageKit",
    products: [
        .library(name: "StorageKit", targets: ["StorageKit"])
    ],
    dependencies: [
         // 📦 Dependency injection / inversion of control framework.
        .package(url: "https://github.com/vapor/service.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "StorageKit", dependencies: ["Service"]),
        .testTarget(name: "StorageKitTests", dependencies: ["StorageKit"])
    ]
)
