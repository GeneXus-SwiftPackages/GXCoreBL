// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXCoreBL",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCoreBL",
			targets: ["GXCoreBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXStandardClasses.git", exact: "1.2.0-beta.37")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreBL-1.2.0-beta.37.xcframework.zip",
			checksum: "45a6bd2909efbf63753371a8db1e8d8776d062cba103d31a52b65294efa809ed"
		)
	]
)