// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MoonBaseSoftwareGithubIo",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "MoonBaseSoftwareGithubIo",
            targets: ["MoonBaseSoftwareGithubIo"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "MoonBaseSoftwareGithubIo",
            dependencies: ["Publish"]
        )
    ]
)