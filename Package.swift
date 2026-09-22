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
            url: "https://ios-sdk-release-1300962221.cos.ap-guangzhou.myqcloud.com/ios/RTCRoomEngine/4.3.0/RTCRoomEngine.xcframework.zip",
            checksum: "6ea8a28e4a14df9e0bdc65dd7d636be9a73ee57bc1c528fbfc0a9283071e0d90"
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
