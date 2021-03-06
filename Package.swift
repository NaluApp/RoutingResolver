// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RoutingResolver",
    platforms: [ .iOS(.v9), .tvOS(.v9)],
    products: [
        .library(name: "RoutingResolver", targets: ["RoutingResolver"])
    ],
    targets: [
        .target(name: "RoutingResolver", path: "Sources", exclude: ["Info.plist"])
    ]
)
