import 'package:flutter/foundation.dart';

/// Where the film is hosted. Drives URL construction, the host chip label
/// shown on the preview card, and the choice of thumbnail endpoint.
enum FilmSource { youtube, googleDrive, instagram }

/// A single film entry rendered as a video preview card on the Films page.
///
/// Each entry carries a stable [key] used both for analytics events and for
/// resolving localized copy via the slang
/// `films.items.[key].{title, excerpt}` path. Card thumbnails use a single
/// shared brand gradient (no per-entry colors), so the entity stays focused
/// on identity + source metadata.
@immutable
class Film {
  const Film({
    required this.key,
    required this.source,
    required this.videoId,
  });

  /// Stable key used for analytics and slang i18n lookups.
  final String key;

  final FilmSource source;

  /// - YouTube → `v=` query parameter
  /// - Google Drive → file id (segment after `/d/` in a share URL)
  /// - Instagram → reel shortcode (segment after `/reel/`)
  final String videoId;

  /// External URL the user is redirected to when tapping the card.
  String get watchUrl => switch (source) {
    FilmSource.youtube => 'https://www.youtube.com/watch?v=$videoId',
    FilmSource.googleDrive => 'https://drive.google.com/file/d/$videoId/view',
    FilmSource.instagram => 'https://www.instagram.com/reel/$videoId/',
  };

  /// Public thumbnail URL. Empty string means "no remote thumbnail
  /// available" — the card falls back to the accent gradient + film glyph.
  ///
  /// - YouTube exposes a stable `img.youtube.com` endpoint that doesn't
  ///   require auth and has no rate limit for hotlinking.
  /// - Google Drive's `/thumbnail?id=...` endpoint is best-effort: it only
  ///   works when the file is shared as "Anyone with the link". If the
  ///   image fails to load, the card renders the gradient placeholder.
  /// - Instagram has no hotlinkable public thumbnail endpoint, so we
  ///   always render the gradient placeholder for reels.
  String get thumbnailUrl => switch (source) {
    FilmSource.youtube => 'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
    FilmSource.googleDrive => 'https://drive.google.com/thumbnail?id=$videoId&sz=w800',
    FilmSource.instagram => '',
  };

  /// Human-readable host label for the card chip.
  String get hostLabel => switch (source) {
    FilmSource.youtube => 'YOUTUBE',
    FilmSource.googleDrive => 'GOOGLE DRIVE',
    FilmSource.instagram => 'INSTAGRAM',
  };

  /// Stable identifier for analytics events.
  String get sourceTag => switch (source) {
    FilmSource.youtube => 'youtube',
    FilmSource.googleDrive => 'google_drive',
    FilmSource.instagram => 'instagram',
  };
}
