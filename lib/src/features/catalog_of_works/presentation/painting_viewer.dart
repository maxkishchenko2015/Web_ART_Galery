import 'package:material_ui/material_ui.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/aspect_aware_image.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/widgets/painting_details_panel.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/fullscreen_image_viewer.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Opens [painting] full screen with its details panel (title, year, medium,
/// size) and logs `gallery_image_opened` tagged with [origin].
Future<void> openPaintingFullscreen(
  BuildContext context,
  Painting painting, {
  required Object heroTag,
  String? origin,
}) {
  AppTelemetry.instance.logEvent(
    'gallery_image_opened',
    params: <String, Object?>{
      'painting_id': painting.pictureId,
      'painting_title': painting.name,
      'painting_year': painting.yearOfCreation,
      'origin': ?origin,
    },
  );
  return FullscreenImageViewer.show(
    context,
    imagePathOrUrl: AspectAwareImage.resolveUrl(painting.imageUrl),
    heroTag: heroTag,
    useImageKitEndpoint: false,
    details: PaintingDetailsPanel(painting: painting),
  );
}
