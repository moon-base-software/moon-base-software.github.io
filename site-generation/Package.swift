// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MoonBaseSoftware",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "MoonBaseSoftware",
            targets: ["MoonBaseSoftware"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "MoonBaseSoftware",
            path: "Sources",
            dependencies: ["Publish"]
        )
    ]
)