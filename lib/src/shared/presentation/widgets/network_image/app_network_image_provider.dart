import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:web_art_galery/src/shared/config/cache/app_cache_manager.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/network_image/decode_image_bytes_stub.dart'
    if (dart.library.js_interop) 'package:web_art_galery/src/shared/presentation/widgets/network_image/decode_image_bytes_web.dart';

/// Network image provider backed by [AppCacheManager].
///
/// Why not `CachedNetworkImageProvider` / `NetworkImage`: on Flutter 3.47 web,
/// images the engine decodes through the browser stay backed by an `<img>` /
/// `VideoFrame` source, and that source is released as soon as the `ui.Image`
/// is disposed (ImageCache eviction, leaving a route) — while a picture may
/// still draw it. Result: black tiles and `ImageCodecException: Failed to
/// create image from Image.decode`, worst on iOS Safari
/// (flutter/flutter#191800). The fix (flutter/flutter#192516) isn't in any
/// 3.47.x release.
///
/// On web this provider decodes the bytes itself into raw pixels and hands
/// them to `decodeImageFromPixels`, so every image owns its pixels and has no
/// browser source to lose. Swap back to a stock provider once on a Flutter
/// release that includes #192516.
@immutable
class AppNetworkImageProvider extends ImageProvider<AppNetworkImageProvider> {
  const AppNetworkImageProvider(this.url);

  final String url;

  @override
  Future<AppNetworkImageProvider> obtainKey(ImageConfiguration configuration) =>
      SynchronousFuture<AppNetworkImageProvider>(this);

  @override
  ImageStreamCompleter loadImage(AppNetworkImageProvider key, ImageDecoderCallback decode) {
    return OneFrameImageStreamCompleter(
      _load(key, decode),
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty<ImageProvider>('Image provider', this),
      ],
    );
  }

  Future<ImageInfo> _load(AppNetworkImageProvider key, ImageDecoderCallback decode) async {
    try {
      final file = await AppCacheManager().getSingleFile(key.url);
      final bytes = await file.readAsBytes();
      final image = await decodeImageBytes(bytes, decode);
      return ImageInfo(image: image, debugLabel: key.url);
    } catch (_) {
      // Drop the failed entry so the next visit retries instead of replaying
      // the cached error (same as the framework's NetworkImage).
      scheduleMicrotask(() => PaintingBinding.instance.imageCache.evict(key));
      rethrow;
    }
  }

  @override
  bool operator ==(Object other) => other is AppNetworkImageProvider && other.url == url;

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() => '${objectRuntimeType(this, 'AppNetworkImageProvider')}("$url")';
}
