import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

class NetworkVideoPlayer extends StatefulWidget {
  const NetworkVideoPlayer({
    super.key,
    required this.videoUrl,
    this.autoPlay = false,
    this.loop = false,
    this.showOpenExternallyButton = true,
  });

  final String videoUrl;
  final bool autoPlay;
  final bool loop;
  final bool showOpenExternallyButton;

  @override
  State<NetworkVideoPlayer> createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
  late final VideoPlayerController _controller;
  bool _isReady = false;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _init();
  }

  Future<void> _init() async {
    try {
      await _controller.initialize();
      await _controller.setLooping(widget.loop);
      if (widget.autoPlay) {
        await _controller.play();
      }

      if (!mounted) {
        return;
      }

      setState(() {
        _isReady = true;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _error = error;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return _VideoError(
        showOpenExternallyButton: widget.showOpenExternallyButton,
        onOpenExternally: () => UrlLauncherUtils.launchUrlIfPossible(url: widget.videoUrl),
      );
    }

    if (!_isReady) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
                setState(() {});
              },
              icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
            ),
            Expanded(
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
            if (widget.showOpenExternallyButton)
              IconButton(
                onPressed: () => UrlLauncherUtils.launchUrlIfPossible(url: widget.videoUrl),
                icon: const Icon(Icons.open_in_new),
                tooltip: 'Open video URL',
              ),
          ],
        ),
      ],
    );
  }
}

class _VideoError extends StatelessWidget {
  const _VideoError({required this.showOpenExternallyButton, required this.onOpenExternally});

  final bool showOpenExternallyButton;
  final VoidCallback onOpenExternally;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline),
          const SizedBox(height: 8),
          const Text('Failed to load video stream'),
          if (showOpenExternallyButton)
            TextButton.icon(
              onPressed: onOpenExternally,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open externally'),
            ),
        ],
      ),
    );
  }
}
