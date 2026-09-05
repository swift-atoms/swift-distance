// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-distance",
    platforms: [
        .macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27),
    ],
    products: [
        .library(name: "Distance", targets: ["Distance"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-subtraction.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Distance",
            dependencies: [
                .product(name: "Subtraction", package: "swift-subtraction"),
            ]
        ),
        .testTarget(
            name: "Distance Tests",
            dependencies: [
                .target(name: "Distance"),
                .product(name: "Subtraction", package: "swift-subtraction"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
