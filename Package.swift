// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [ .iOS(.v13) ],
    products: [
        .library(name: "NetworkingStatic", targets: ["Networking"]),
        .library(name: "Networking", type: .dynamic, targets: ["Networking"])
    ],
    targets: [
        .target(name: "Networking",
                path:"Sources",
                exclude: ["Info.plist"])
    ]
)
