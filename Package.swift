// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ffmpeg-kit-ios",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ffmpegkit",
            targets: [
                "ffmpegkit",
                "libavcodec",
                "libavdevice",
                "libavfilter",
                "libavformat",
                "libavutil",
                "libswresample",
                "libswscale"
            ])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "ffmpegkit",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/ffmpegkit.xcframework.zip",
            checksum: "7e08798a93eeae51ce7e85ff737875d107d5fd7e84bc70b333df61e41f25e02a"
        ),
        .binaryTarget(
            name: "libavcodec",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/libavcodec.xcframework.zip",
            checksum: "50f9cbd92cf6fbb19f34119e375ebdea3192261c720ca5b6a9b5c48f12e47b0c"
        ),
        .binaryTarget(
            name: "libavdevice",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/libavdevice.xcframework.zip",
            checksum: "5c8a6462d222381f3609fc3e026db219955359077e39de91d775fbbc619a7a54"
        ),
        .binaryTarget(
            name: "libavfilter",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/libavfilter.xcframework.zip",
            checksum: "542251e84f2c93c8e256ed9994018653e7aff8365324a03dca9de1336860f011"
        ),
        .binaryTarget(
            name: "libavformat",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/libavformat.xcframework.zip",
            checksum: "ee422d4c56527a985d95b52b4a52ea65f1bda9e71f6f1d39d6dccfc1dd931d5d"
        ),
        .binaryTarget(
            name: "libavutil",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/libavutil.xcframework.zip",
            checksum: "cd5a3e99c378832c7d95bc89b7e8c75af648deaff29b7c0492d93b371f6eddba"
        ),
        .binaryTarget(
            name: "libswresample",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/libswresample.xcframework.zip",
            checksum: "b6a6e1e58b9da229f0b61b403d99adc014e4bc4dd1c80fc6ed8ee68584eda74a"
        ),
        .binaryTarget(
            name: "libswscale",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.0-custom-build/libswscale.xcframework.zip",
            checksum: "2a57c6553395a84979b75d02a2fbc0273150b9e562d359653f334e5e4d0af126"
        )
    ]
)
