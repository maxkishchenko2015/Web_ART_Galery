import 'package:flutter/foundation.dart';

/// Painting size parsed from the tail of the medium string
/// ("Холст, масло, 160*120" → 160 × 120 cm). The catalog lists height first.
@immutable
class PaintingDimensions {
  const PaintingDimensions({required this.height, required this.width});

  final double height;
  final double width;

  /// Trailing "H*W" (also ×, x, Cyrillic х; decimal comma allowed; optional
  /// "см"/"cm"), with the comma that separates it from the medium.
  static final RegExp _pattern = RegExp(
    r',?\s*(\d+(?:[.,]\d+)?)\s*[*×xх]\s*(\d+(?:[.,]\d+)?)\s*(?:см|cm)?\.?\s*$',
    caseSensitive: false,
  );

  /// Size found at the end of [medium], or null when it has none.
  static PaintingDimensions? parse(String medium) {
    final match = _pattern.firstMatch(medium.trim());
    if (match == null) return null;
    final height = _toDouble(match.group(1)!);
    final width = _toDouble(match.group(2)!);
    if (height == null || width == null || height <= 0 || width <= 0) return null;
    return PaintingDimensions(height: height, width: width);
  }

  /// [medium] without its trailing size ("Canvas, oil, 160*120" → "Canvas, oil").
  static String stripFrom(String medium) => medium.trim().replaceFirst(_pattern, '').trim();

  static double? _toDouble(String raw) => double.tryParse(raw.replaceAll(',', '.'));

  /// "43,5" / "160" — keeps the catalog's decimal comma, drops ".0".
  static String format(double value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    return value.toString().replaceAll('.', ',');
  }
}
