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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXStandardClasses.git", exact: "2.2.0-beta.13")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreBL-2.2.0-beta.13.xcframework.zip",
			checksum: "6ec398dbee80d48b0db0db6f151b84a745f206b3e1aa8b7f00c304119041d744"
		)
	]
)