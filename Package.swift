// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "StorageKit",
    products: [
        .library(name: "StorageKit", targets: ["StorageKit"])
    ],
    dependencies: [
         // 📦 Dependency injection / inversion of control framework.
        .package(url: "https://github.com/vapor/service.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor/engine.git", from: "3.0.0-rc")
    ],
    targets: [
        .target(name: "StorageKit", dependencies: ["Service", "HTTP"]),
        .testTarget(name: "StorageKitTests", dependencies: ["StorageKit"])
    ]
)
