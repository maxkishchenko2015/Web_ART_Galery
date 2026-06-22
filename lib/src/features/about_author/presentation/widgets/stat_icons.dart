import 'package:flutter/material.dart';

/// Vector stat icons drawn with [CustomPainter] instead of the MaterialIcons
/// font.
///
/// `Icons.emoji_events_outlined` (trophy) and `Icons.public_outlined` (globe)
/// render blank in the web build: they reach an `Icon(...)` only through a
/// field (`_StatItem.icon`) rather than a literal `Icon(Icons.x)`, so the icon
/// tree-shaker drops their glyphs from the subset font and they never appear.
/// Painting the shapes directly removes the font dependency entirely, so these
/// always render regardless of build flags or CanvasKit font handling.
///
/// Both are stroke-outlined to match the surrounding `_outlined` Material
/// Icons. [size] is the square side; the stroke scales with it.

class TrophyOutlineIcon extends StatelessWidget {
  const TrophyOutlineIcon({super.key, required this.color, this.size = 24});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _TrophyPainter(color)),
    );
  }
}

class GlobeOutlineIcon extends StatelessWidget {
  const GlobeOutlineIcon({super.key, required this.color, this.size = 24});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _GlobePainter(color)),
    );
  }
}

class _TrophyPainter extends CustomPainter {
  const _TrophyPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.07
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    // Cup bowl: rim across the top, sides curving in to a rounded bottom.
    final bowl = Path()
      ..moveTo(s * 0.28, s * 0.18)
      ..lineTo(s * 0.72, s * 0.18)
      ..lineTo(s * 0.72, s * 0.34)
      ..cubicTo(s * 0.72, s * 0.56, s * 0.61, s * 0.66, s * 0.50, s * 0.66)
      ..cubicTo(s * 0.39, s * 0.66, s * 0.28, s * 0.56, s * 0.28, s * 0.34)
      ..close();
    canvas.drawPath(bowl, paint);

    // Side handles.
    canvas.drawPath(
      Path()
        ..moveTo(s * 0.28, s * 0.22)
        ..cubicTo(s * 0.13, s * 0.22, s * 0.13, s * 0.43, s * 0.31, s * 0.45),
      paint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(s * 0.72, s * 0.22)
        ..cubicTo(s * 0.87, s * 0.22, s * 0.87, s * 0.43, s * 0.69, s * 0.45),
      paint,
    );

    // Stem + base.
    canvas.drawLine(Offset(s * 0.50, s * 0.66), Offset(s * 0.50, s * 0.78), paint);
    canvas.drawLine(Offset(s * 0.44, s * 0.78), Offset(s * 0.56, s * 0.78), paint);
    canvas.drawLine(Offset(s * 0.36, s * 0.84), Offset(s * 0.64, s * 0.84), paint);
  }

  @override
  bool shouldRepaint(_TrophyPainter oldDelegate) => oldDelegate.color != color;
}

class _GlobePainter extends CustomPainter {
  const _GlobePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.07
      ..strokeCap = StrokeCap.round;

    final center = Offset(s / 2, s / 2);
    final r = s * 0.40;

    canvas.drawCircle(center, r, paint);
    // Meridian (vertical ellipse) for the 3-D read.
    canvas.drawOval(
      Rect.fromCenter(center: center, width: r * 0.92, height: r * 2),
      paint,
    );
    // Equator + two latitude lines, clipped to the sphere so they don't poke out.
    canvas.save();
    canvas.clipPath(Path()..addOval(Rect.fromCircle(center: center, radius: r)));
    canvas.drawLine(Offset(center.dx - r, center.dy), Offset(center.dx + r, center.dy), paint);
    final ly = r * 0.55;
    canvas.drawLine(Offset(center.dx - r, center.dy - ly), Offset(center.dx + r, center.dy - ly), paint);
    canvas.drawLine(Offset(center.dx - r, center.dy + ly), Offset(center.dx + r, center.dy + ly), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_GlobePainter oldDelegate) => oldDelegate.color != color;
}
