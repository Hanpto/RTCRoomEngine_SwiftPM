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
            url: "https://ios-sdk-release-1300962221.cos.ap-guangzhou.myqcloud.com/ios/RTCRoomEngine/4.3.5/RTCRoomEngine.xcframework.zip",
            checksum: "4fb1afbce9e469b5b467f7339c9f600cdcfbb448eb848bfa21d01b233900a56a"
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
