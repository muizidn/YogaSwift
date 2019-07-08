// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YogaSwift",
    products: [
        .executable(
            name: "example",
            targets: ["example"]),
        .library(
            name: "YogaSwift",
            targets: ["YogaSwift"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "example",
            dependencies: ["YogaSwift"]),
        .target(
            name: "YogaSwift",
            dependencies: ["CYoga"]),
        .target(
            name: "CYoga"),
        .testTarget(
            name: "YogaSwiftTests",
            dependencies: ["YogaSwift"])
    ]
)
