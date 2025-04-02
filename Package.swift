// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreBL",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXCoreBL",
			targets: ["GXCoreBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXStandardClasses.git", exact: "3.1.0-beta.11")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreBL-3.1.0-beta.11.xcframework.zip",
			checksum: "dc1850adc465f5d6d300824007f23794aa16335656f2aaa25d2ba3a8c7586d0a"
		)
	]
)