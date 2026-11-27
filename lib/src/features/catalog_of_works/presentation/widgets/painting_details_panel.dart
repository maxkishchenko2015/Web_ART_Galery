import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_dimensions.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_medium_localization.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/localization/painting_name_localization.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Frosted caption shown under a painting in the fullscreen viewer: year,
/// title, medium and — when the catalog has it — the size, drawn as a small
/// to-scale frame with dimension lines (like a technical drawing).
///
/// Sits on the viewer's black backdrop in every site palette, so it uses
/// fixed light-on-dark tones plus the palette accent.
class PaintingDetailsPanel extends StatelessWidget {
  const PaintingDetailsPanel({super.key, required this.painting});

  final Painting painting;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final accent = context.colors.terracottaLight;
    final isPhone = MediaQuery.sizeOf(context).width < KSize.adaptiveCompactBreakpoint;
    final name = PaintingNameLocalization.resolveName(
      t,
      painting.pictureId,
      firebaseName: painting.name,
    );
    final medium = PaintingMediumLocalization.resolve(t, painting.paintedOnAndHow);
    final dimensions = PaintingDimensions.parse(medium);
    final mediumOnly = PaintingDimensions.stripFrom(medium);

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${painting.yearOfCreation}',
          style: GoogleFonts.roboto(
            fontSize: KSize.fontSize2XS,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.8,
            color: accent,
          ),
        ),
        const SizedBox(height: KSize.margin1Halfx),
        Text(
          name,
          style: GoogleFonts.ptSerif(
            fontSize: isPhone ? KSize.fontSizeXL : KSize.fontSize2XL + 2,
            height: 1.2,
            color: _ink,
          ),
        ),
        if (mediumOnly.isNotEmpty) ...[
          const SizedBox(height: KSize.margin1Halfx),
          Text(
            mediumOnly,
            style: GoogleFonts.roboto(
              fontSize: KSize.fontSizeXS,
              fontWeight: FontWeight.w300,
              color: _inkMuted,
            ),
          ),
        ],
        if (dimensions != null) ...[
          const SizedBox(height: KSize.margin3x),
          Text(
            '${t.pages.catalog.size}: ${PaintingDimensions.format(dimensions.height)} × '
            '${PaintingDimensions.format(dimensions.width)} ${t.pages.catalog.cm}',
            style: GoogleFonts.roboto(
              fontSize: KSize.fontSize2XSHalf,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
              color: _ink,
            ),
          ),
        ],
      ],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(KSize.homeCardRadius + 4),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: KSize.mobileAppBarBlurSigma,
          sigmaY: KSize.mobileAppBarBlurSigma,
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: KSize.paintingPanelMaxWidth),
          padding: EdgeInsets.all(isPhone ? KSize.margin4x : KSize.margin6x),
          decoration: BoxDecoration(
            color: _glass,
            borderRadius: BorderRadius.circular(KSize.homeCardRadius + 4),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: copy),
              if (dimensions != null) ...[
                SizedBox(width: isPhone ? KSize.margin4x : KSize.margin8x),
                _DimensionsDiagram(
                  dimensions: dimensions,
                  unit: t.pages.catalog.cm,
                  accent: accent,
                  maxSide: isPhone ? KSize.paintingDiagramSidePhone : KSize.paintingDiagramSide,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  static const Color _glass = Color(0xB3141210);
  static const Color _ink = Color(0xFFF5EFE4);
  static const Color _inkMuted = Color(0xB3F5EFE4);
}

/// The painting as a to-scale frame with a width line below and a height
/// line on the right, each with end ticks and its value in cm.
class _DimensionsDiagram extends StatelessWidget {
  const _DimensionsDiagram({
    required this.dimensions,
    required this.unit,
    required this.accent,
    required this.maxSide,
  });

  final PaintingDimensions dimensions;
  final String unit;
  final Color accent;
  final double maxSide;

  @override
  Widget build(BuildContext context) {
    final h = dimensions.height;
    final w = dimensions.width;
    final scale = maxSide / math.max(h, w);
    final frame = Size(w * scale, h * scale);
    final labelStyle = GoogleFonts.roboto(
      fontSize: KSize.fontSize3XS,
      fontWeight: FontWeight.w500,
      color: PaintingDetailsPanel._inkMuted,
    );

    return CustomPaint(
      size: Size(frame.width + KSize.paintingDiagramLabelSpace, frame.height + KSize.margin7x),
      painter: _DimensionsPainter(
        frame: frame,
        accent: accent,
        widthLabel: '${PaintingDimensions.format(w)} $unit',
        heightLabel: '${PaintingDimensions.format(h)} $unit',
        labelStyle: labelStyle,
      ),
    );
  }
}

class _DimensionsPainter extends CustomPainter {
  _DimensionsPainter({
    required this.frame,
    required this.accent,
    required this.widthLabel,
    required this.heightLabel,
    required this.labelStyle,
  });

  final Size frame;
  final Color accent;
  final String widthLabel;
  final String heightLabel;
  final TextStyle labelStyle;

  static const double _gap = 8;
  static const double _tick = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & frame;
    canvas.drawRect(rect, Paint()..color = accent.withValues(alpha: 0.16));
    canvas.drawRect(
      rect,
      Paint()
        ..color = accent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );

    final line = Paint()
      ..color = accent.withValues(alpha: 0.85)
      ..strokeWidth = 1;

    // Width: below the frame.
    final y = frame.height + _gap;
    canvas.drawLine(Offset(0, y), Offset(frame.width, y), line);
    canvas.drawLine(Offset(0, y - _tick), Offset(0, y + _tick), line);
    canvas.drawLine(Offset(frame.width, y - _tick), Offset(frame.width, y + _tick), line);
    final widthText = _layout(widthLabel);
    widthText.paint(
      canvas,
      Offset(math.max(0, (frame.width - widthText.width) / 2), y + _tick + 2),
    );

    // Height: right of the frame.
    final x = frame.width + _gap;
    canvas.drawLine(Offset(x, 0), Offset(x, frame.height), line);
    canvas.drawLine(Offset(x - _tick, 0), Offset(x + _tick, 0), line);
    canvas.drawLine(Offset(x - _tick, frame.height), Offset(x + _tick, frame.height), line);
    final heightText = _layout(heightLabel);
    heightText.paint(canvas, Offset(x + _tick + 4, (frame.height - heightText.height) / 2));
  }

  TextPainter _layout(String text) => TextPainter(
    text: TextSpan(text: text, style: labelStyle),
    textDirection: TextDirection.ltr,
  )..layout();

  @override
  bool shouldRepaint(_DimensionsPainter oldDelegate) =>
      oldDelegate.frame != frame ||
      oldDelegate.accent != accent ||
      oldDelegate.widthLabel != widthLabel ||
      oldDelegate.heightLabel != heightLabel;
}
