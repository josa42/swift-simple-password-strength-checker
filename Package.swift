// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SimplePasswordChecker",
    products: [
        .library(name: "SimplePasswordChecker", targets: ["SimplePasswordChecker"]),
    ],
    targets: [
        .target(
            name: "SimplePasswordChecker"),
        .testTarget(
            name: "SimplePasswordCheckerTests",
            dependencies: ["SimplePasswordChecker"]),
    ]
)
