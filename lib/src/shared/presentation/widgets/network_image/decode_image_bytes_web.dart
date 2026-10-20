import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';
import 'package:web/web.dart' as web;

/// Upper bound for `decodeImageFromPixels`: it never calls back when the engine
/// fails to allocate the image, so without this the load would hang forever.
const Duration _pixelsDecodeTimeout = Duration(seconds: 15);

/// Web: lets the browser decode [bytes] (honouring EXIF orientation), reads the
/// RGBA pixels back and builds the image from them. The engine then copies the
/// pixels into its own image instead of keeping a reference to a browser
/// `<img>` / `VideoFrame` — see `AppNetworkImageProvider` for why.
Future<ui.Image> decodeImageBytes(Uint8List bytes, ImageDecoderCallback decode) async {
  final blob = web.Blob(<JSAny>[bytes.toJS].toJS);
  final bitmap = await web.window.createImageBitmap(blob).toDart;
  final width = bitmap.width;
  final height = bitmap.height;

  final Uint8List pixels;
  try {
    final canvas = web.OffscreenCanvas(width, height);
    final context = canvas.getContext('2d')! as web.OffscreenCanvasRenderingContext2D;
    context.drawImage(bitmap, 0, 0);
    final data = context.getImageData(0, 0, width, height).data.toDart;
    pixels = Uint8List.view(data.buffer, data.offsetInBytes, data.lengthInBytes);
  } finally {
    bitmap.close();
  }

  // getImageData returns straight alpha; the engine expects premultiplied.
  // JPEGs have no alpha, so skip the pass for them.
  if (!_isJpeg(bytes)) {
    _premultiplyAlpha(pixels);
  }

  final completer = Completer<ui.Image>();
  ui.decodeImageFromPixels(pixels, width, height, ui.PixelFormat.rgba8888, completer.complete);
  return completer.future.timeout(_pixelsDecodeTimeout);
}

bool _isJpeg(Uint8List bytes) => bytes.length > 2 && bytes[0] == 0xFF && bytes[1] == 0xD8;

void _premultiplyAlpha(Uint8List rgba) {
  for (var i = 3; i < rgba.length; i += 4) {
    final alpha = rgba[i];
    if (alpha == 255) {
      continue;
    }
    rgba[i - 3] = rgba[i - 3] * alpha ~/ 255;
    rgba[i - 2] = rgba[i - 2] * alpha ~/ 255;
    rgba[i - 1] = rgba[i - 1] * alpha ~/ 255;
  }
}
