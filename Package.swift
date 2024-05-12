// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aptos-swift-sdk",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "aptos-swift-sdk",
            targets: ["aptos-swift-sdk"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "aptos-swift-sdk"),
        .testTarget(
            name: "aptos-swift-sdkTests",
            dependencies: ["aptos-swift-sdk"]),
    ]
)
