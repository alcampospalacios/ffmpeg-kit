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
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/ffmpegkit.xcframework.zip",
            checksum: "de0affab5cc9b0413b88fa5846098d0ab439362a561fa6478093071008067e3b"
        ),
        .binaryTarget(
            name: "libavcodec",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/libavcodec.xcframework.zip",
            checksum: "0593523e376481cef1a5d3e6f8c9fe272f1dcc902382a587fac81b1691d616a7"
        ),
        .binaryTarget(
            name: "libavdevice",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/libavdevice.xcframework.zip",
            checksum: "c249d2733b1316190c6e4b6f0c0c495bb7663c5c22a2acdf706df9ca61c4571f"
        ),
        .binaryTarget(
            name: "libavfilter",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/libavfilter.xcframework.zip",
            checksum: "aee2465e61c4d476a9625d8ee448f01410cb0e2819be48f2858bfe2fff076222"
        ),
        .binaryTarget(
            name: "libavformat",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/libavformat.xcframework.zip",
            checksum: "4b61617e2e5551d255d9512c0d248154f2a644f4519d27bf62776cbaa185a49d"
        ),
        .binaryTarget(
            name: "libavutil",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/libavutil.xcframework.zip",
            checksum: "1856d813f64fb8c81d23eb18aa539973006b92acedfcbbe039b49a64557342a5"
        ),
        .binaryTarget(
            name: "libswresample",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/libswresample.xcframework.zip",
            checksum: "32fec2f646376789da78fcf3406d3089d029bdd646005bdd5a17b4e300c14ab3"
        ),
        .binaryTarget(
            name: "libswscale",
            url: "https://github.com/alcampospalacios/ffmpeg-kit/releases/download/v6.0.1-custom-build/libswscale.xcframework.zip",
            checksum: "1c6654a6bf1d9a61fdf842fb07f720aa406f30d775cd274f4a4e56f768a9c492"
        )
    ]
)
