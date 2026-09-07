// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-distance",
    platforms: [
        .macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27),
    ],
    products: [
        .library(name: "Distance", targets: ["Distance"]),
        .library(name: "Distance Standard Library Integration", targets: ["Distance Standard Library Integration"]),
        .library(name: "Distance Foundation Library Integration", targets: ["Distance Foundation Library Integration"]),
        .library(name: "Distance Test Support", targets: ["Distance Test Support"]),
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
            ],
            path: "Sources/Distance"
        ),
        .target(
            name: "Distance Standard Library Integration",
            dependencies: [
                .target(name: "Distance"),
            ],
            path: "Sources/Distance Standard Library Integration"
        ),
        .target(
            name: "Distance Foundation Library Integration",
            dependencies: [
                .target(name: "Distance"),
                .target(name: "Distance Standard Library Integration"),
            ],
            path: "Sources/Distance Foundation Library Integration"
        ),
        .target(
            name: "Distance Test Support",
            dependencies: [
                .target(name: "Distance"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Distance Tests",
            dependencies: [
                .target(name: "Distance"),
                .product(name: "Subtraction", package: "swift-subtraction"),
                .target(name: "Distance Test Support"),
                .target(name: "Distance Standard Library Integration"),
                .target(name: "Distance Foundation Library Integration"),
            ],
            path: "Tests/Distance Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
