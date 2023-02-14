// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyRNG",
    products: [
        .library(name: "SwiftyRNG", targets: ["SwiftyRNG"])
    ],
    targets: [
        .systemLibrary(
            name: "CGSL",
            pkgConfig: "gsl",
            providers: [
                .brew(["gsl"]),
                .apt(["libgsl-dev"]),
            ]
        ),
        .target(
            name: "SwiftyRNG",
            dependencies: ["CGSL"]
        ),
    ]
)
