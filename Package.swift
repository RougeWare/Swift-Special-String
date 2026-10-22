// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpecialString",
    
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SpecialString",
            targets: ["SpecialString"]),
        
        // DEPRECATED: Does not play nice with App Store requirements
        .library(
            name: "SpecialString_dynamic",
            type: .dynamic,
            targets: ["SpecialString"]),
        
        .library(
            name: "SpecialStringDynamic",
            type: .dynamic,
            targets: ["SpecialString"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/RougeWare/Swift-EssentiallyAString", from: "1.0.1"),
    ],
    
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SpecialString",
            dependencies: [
                .product(name: "EssentiallyAString", package: "Swift-EssentiallyAString"),
            ]),
        .testTarget(
            name: "SpecialStringTests",
            dependencies: ["SpecialString"]),
    ]
)
