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
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "9.0.7652"),
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", from: "13.3.20845")
    ],
    targets: [
        .binaryTarget(
            name: "RTCRoomEngineBinary",
            url: "https://ios-sdk-release-1300962221.cos.ap-guangzhou.myqcloud.com/ios/RTCRoomEngine/4.3.0/RTCRoomEngine.xcframework.zip",
            checksum: "a5b90331706c438762cdcd38d6a292c18932dc3c7ea9ca5e284418d72dbe38eb"
        ),
        .target(
            name: "RTCRoomEngineDeps",
            dependencies: [
                .product(name: "Chat_SDK_SwiftPM", package: "Chat_SDK_SwiftPM"),
                .product(name: "Professional_SwiftPM", package: "Professional_SwiftPM")
            ],
            path: "Sources/Deps",
            linkerSettings: [
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("sqlite3")
            ]
        )
    ]
)
