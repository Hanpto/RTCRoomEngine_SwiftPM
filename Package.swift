// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "RTCRoomEngine",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "RTCRoomEngine",
                 targets: ["RTCRoomEngineBinary", "RTCRoomEngineDeps"])
    ],
    dependencies: [
        .package(url: "https://github.com/Hanpto/TXIMSDK_Plus_SwiftPM.git", from: "9.0.7667"),
        .package(url: "https://github.com/Hanpto/TRTC_Professional_SwiftPM.git", from: "13.5.21355")
    ],
    targets: [
        .binaryTarget(
            name: "RTCRoomEngineBinary",
            url: "https://ios-sdk-release-1300962221.cos.ap-guangzhou.myqcloud.com/ios/RTCRoomEngine/4.3.1/RTCRoomEngine.xcframework.zip",
            checksum: "c4d3581c8a5757c0e45206e7ffeaf1a0c92bfaf8824de0774da1084d58df55bc"
        ),
        .target(
            name: "RTCRoomEngineDeps",
            dependencies: [
                .product(name: "TXIMSDK_Plus", package: "TXIMSDK_Plus_SwiftPM"),
                .product(name: "TRTC_Professional", package: "TRTC_Professional_SwiftPM")
            ],
            path: "Sources/Deps",
            linkerSettings: [
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("sqlite3")
            ]
        )
    ]
)
