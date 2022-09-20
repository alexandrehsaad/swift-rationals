// swift-tools-version:5.7

import PackageDescription

let package: Package = .init(
	name: "swift-rationals",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.macCatalyst(.v15),
		.macOS(.v10_15),
		.watchOS(.v6)
	],
	products: [
		.library(name: "Rationals", targets: ["Rationals"])
	],
	dependencies: [
		.package(url: "https://github.com/alexandrehsaad/swift-contributors-plugin", branch: "main"),
		.package(url: "https://github.com/alexandrehsaad/swift-numeric-protocols.git", branch: "main"),
		.package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMinor(from: "1.0.0"))
	],
	targets: [
		.target(
			name: "Rationals",
			dependencies: [
				.product(name: "NumericProtocols", package: "swift-numeric-protocols")
			],
			path: "Sources"
		),
		.testTarget(
			name: "RationalsTests",
			dependencies: ["Rationals"],
			path: "Tests",
			resources: [
				.process("RationalsTests/Resources")
			]
		)
	],
	swiftLanguageVersions: [.v5]
)
