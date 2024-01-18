// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXCoreBL",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCoreBL",
			targets: ["GXCoreBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXStandardClasses.git", exact: "1.4.0-rc.21")
	],
	targets: [
		.target(name: "GXCoreBLWrapper",
				dependencies: [
					"GXCoreBL",
					.product(name: "GXStandardClasses", package: "GXStandardClasses", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreBL",
			url: "https://pkgs.genexus.dev/iOS/preview/GXCoreBL-1.4.0-rc.21.xcframework.zip",
			checksum: "bca3a242f47e0490d26af67ecdaf447129a1b3d72879b05d3bba07d275eb56ba"
		)
	]
)