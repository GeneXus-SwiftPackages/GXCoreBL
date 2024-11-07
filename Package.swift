// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreBL",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXCoreBL",
			targets: ["GXCoreBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXStandardClasses.git", exact: "2.2.0-beta.10")
	],
	targets: [
		.target(name: "GXCoreBLWrapper",
				dependencies: [
					"GXCoreBL",
					.product(name: "GXStandardClasses", package: "GXStandardClasses", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreBL",
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreBL-2.2.0-beta.10.xcframework.zip",
			checksum: "c4137c507beff4c5d49c52f6f4677c8b1a51c54ca22c93726bfbbda8d0e658a7"
		)
	]
)