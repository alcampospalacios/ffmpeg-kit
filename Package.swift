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
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/ffmpegkit.xcframework.zip",
            checksum: "7cc6873a5cccf2140e94ea388c83afa613164028e19d03d212421cf23792b2e4"
        ),
        .binaryTarget(
            name: "libavcodec",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/libavcodec.xcframework.zip",
            checksum: "6d9f63a287a5a16ae693f6d927c84732ec7e58e69ba0fd440dd72180e32e9a65"
        ),
        .binaryTarget(
            name: "libavdevice",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/libavdevice.xcframework.zip",
            checksum: "e89df29ebfc2c2c5ecc089def18175755d55b8b6fdb6c0fcbd25ea42a34f80e2"
        ),
        .binaryTarget(
            name: "libavfilter",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/libavfilter.xcframework.zip",
            checksum: "64a47370afe006ab531410f4c555d8f98ce735c18c48356ee9cdf363c4cdffda"
        ),
        .binaryTarget(
            name: "libavformat",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/libavformat.xcframework.zip",
            checksum: "498eba93fa19f957eadc33457ec5fdcd4da86178e057066736a041e6e953939c"
        ),
        .binaryTarget(
            name: "libavutil",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/libavutil.xcframework.zip",
            checksum: "84e59530bd615dbf3d2733a0ebbc5614ccbe9e0116542a40d2b78ceeb6c7e060"
        ),
        .binaryTarget(
            name: "libswresample",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/libswresample.xcframework.zip",
            checksum: "1301934d9a5640af0dff9146b9672dc2338f4539ef66b2931f764757fddfe887"
        ),
        .binaryTarget(
            name: "libswscale",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.2-custom-build/libswscale.xcframework.zip",
            checksum: "7e57f9470fc43640b976482a25821d844312ee8b758ff855369d0f99cf3a741f"
        )
    ]
)
