import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';

/// Non-web: the regular engine decode path has no browser-backed images.
Future<ui.Image> decodeImageBytes(Uint8List bytes, ImageDecoderCallback decode) async {
  final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
  final codec = await decode(buffer);
  try {
    final frame = await codec.getNextFrame();
    return frame.image;
  } finally {
    codec.dispose();
  }
}
