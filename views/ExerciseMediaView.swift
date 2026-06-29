//
//  ExerciseMediaView.swift
//  IDo
//
//  Shows exercise demo images or looping videos when the workout is active.
//

import AVFoundation
import SwiftUI
import UIKit

struct ExerciseMediaView: View {
    let baiTap: BaiTapTre
    var isActive: Bool

    var body: some View {
        Group {
            switch baiTap.mediaKind {
            case .image:
                ExerciseImageView(fileName: baiTap.mediaFileName, fileExtension: baiTap.mediaExtension)
            case .video:
                ExerciseVideoView(
                    fileName: baiTap.mediaFileName,
                    fileExtension: baiTap.mediaExtension,
                    isPlaying: isActive
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 220)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

private struct ExerciseImageView: View {
    let fileName: String
    let fileExtension: String

    var body: some View {
        if let uiImage = ExerciseMediaLoader.uiImage(fileName: fileName, fileExtension: fileExtension) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            mediaPlaceholder(systemName: "photo")
        }
    }
}

private struct ExerciseVideoView: View {
    let fileName: String
    let fileExtension: String
    let isPlaying: Bool

    var body: some View {
        if let url = ExerciseMediaLoader.fileURL(fileName: fileName, fileExtension: fileExtension) {
            ZStack {
                if !isPlaying,
                   let thumbnail = ExerciseMediaLoader.videoThumbnail(fileName: fileName, fileExtension: fileExtension) {
                    Image(uiImage: thumbnail)
                        .resizable()
                        .scaledToFit()
                }
                LoopingVideoPlayer(url: url, isPlaying: isPlaying)
                    .opacity(isPlaying ? 1 : 0)
            }
        } else {
            mediaPlaceholder(systemName: "video.slash")
        }
    }
}

private func mediaPlaceholder(systemName: String) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(.secondarySystemBackground))
        Image(systemName: systemName)
            .font(.system(size: 48))
            .foregroundStyle(.secondary)
    }
}

private enum ExerciseMediaLoader {
    static func fileURL(fileName: String, fileExtension: String) -> URL? {
        Bundle.main.url(forResource: fileName, withExtension: fileExtension, subdirectory: "ExerciseGIFs")
            ?? Bundle.main.url(forResource: fileName, withExtension: fileExtension)
    }

    static func uiImage(fileName: String, fileExtension: String) -> UIImage? {
        guard let url = fileURL(fileName: fileName, fileExtension: fileExtension),
              let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }

    static func videoThumbnail(fileName: String, fileExtension: String) -> UIImage? {
        guard let url = fileURL(fileName: fileName, fileExtension: fileExtension) else { return nil }
        let asset = AVURLAsset(url: url)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        let time = CMTime(seconds: 0.1, preferredTimescale: 600)
        guard let cgImage = try? generator.copyCGImage(at: time, actualTime: nil) else { return nil }
        return UIImage(cgImage: cgImage)
    }
}

private struct LoopingVideoPlayer: UIViewRepresentable {
    let url: URL
    let isPlaying: Bool

    func makeUIView(context: Context) -> ExercisePlayerView {
        let view = ExercisePlayerView()
        view.configure(url: url)
        return view
    }

    func updateUIView(_ uiView: ExercisePlayerView, context: Context) {
        uiView.setPlaying(isPlaying)
    }
}

private final class ExercisePlayerView: UIView {
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var endObserver: NSObjectProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(url: URL) {
        guard player == nil else { return }

        let item = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: item)
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspect
        self.layer.addSublayer(layer)

        self.player = player
        self.playerLayer = layer

        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: item,
            queue: .main
        ) { [weak self] _ in
            self?.player?.seek(to: .zero)
            self?.player?.play()
        }
    }

    func setPlaying(_ playing: Bool) {
        if playing {
            player?.play()
        } else {
            player?.pause()
            player?.seek(to: .zero)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }

    deinit {
        if let endObserver {
            NotificationCenter.default.removeObserver(endObserver)
        }
    }
}