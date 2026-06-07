import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Video preview thumbnail shared across the Films page and the films strip
/// on the About-the-author page.
///
/// Renders the brand-gradient backdrop, the remote thumbnail (when one is
/// available), a host chip and the centered red play button. The gradient
/// doubles as the fallback when the remote thumbnail fails to load (Drive
/// without public sharing, Instagram, YouTube tile fetch errors, etc.).
class FilmThumbnail extends StatelessWidget {
  const FilmThumbnail({
    super.key,
    required this.film,
    required this.featured,
    this.aspectRatio = KSize.filmCardAspectRatio,
  });

  final Film film;
  final bool featured;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = featured ? KSize.radiusLargeExtra : KSize.radiusLarge;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Brand gradient backdrop — also serves as the fallback when the
            // remote thumbnail fails to load (Drive without public sharing,
            // Instagram, YouTube tile fetch errors, etc.).
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colors.forestGreen, colors.darkOlive],
                ),
              ),
            ),
            if (film.thumbnailUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: film.thumbnailUrl,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 180),
                // We deliberately render *no* widget while loading or on
                // error: the gradient backdrop below keeps the box looking
                // intentional, while tile failures stay silent (see also
                // AppTelemetry._isIgnorableError).
                placeholder: (context, _) => const SizedBox.shrink(),
                errorWidget: (context, _, _) => const SizedBox.shrink(),
              ),
            // Subtle scrim so the chip + play button stay legible on top of
            // any thumbnail content.
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withAlpha(40),
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(70),
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
              ),
            ),
            // Host chip
            Positioned(
              top: featured ? KSize.featuredArtworkChipInset : KSize.regularFilmChipInset,
              right: featured ? KSize.featuredArtworkChipInset : KSize.regularFilmChipInset,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSize.margin3x,
                  vertical: KSize.margin1x,
                ),
                decoration: BoxDecoration(
                  color: colors.newsChipFill,
                  borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
                  border: Border.all(color: colors.newsChipBorder),
                ),
                child: Text(film.hostLabel, style: context.textOnDark.footerSitemapLabel),
              ),
            ),
            // Centered red play button — the visual hook from the screenshot.
            Center(child: _PlayButton(featured: featured)),
          ],
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.featured});

  final bool featured;

  @override
  Widget build(BuildContext context) {
    final size = featured ? KSize.playButtonSizeFeatured : KSize.playButtonSizeDefault;
    final iconSize = featured ? KSize.playButtonIconSizeFeatured : KSize.playButtonIconSizeDefault;
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.playButtonRed,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(70),
              blurRadius: KSize.playButtonShadowBlur,
              offset: const Offset(0, KSize.playButtonShadowOffsetY),
            ),
          ],
        ),
        child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: iconSize),
      ),
    );
  }
}
