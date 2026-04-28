/// Static constants used by [AboutAuthorPage].
///
/// Holds the photo indices we pin to each biography section (mapped to the
/// Firestore `AboutAuthor.items` array) and the external article URLs shown
/// next to the matching biography sections.
abstract final class AboutAuthorPageConstants {
  const AboutAuthorPageConstants._();

  // ── Pinned photo indices ─────────────────────────────────────────────────

  static const int heroPhotoIndex = 0;
  static const int universalRealismPhotoIndex = 1;
  static const int tapestryPhotoIndex = 2;
  static const int chernobylPhotoIndex = 3;
  static const int mosaicPhotoIndex = 4;

  // ── External references rendered as "Open article" CTAs ─────────────────

  static const String tapestryExternalUrl =
      'https://robbielafleur.com/2016/01/16/tapestry-of-the-century/';
  static const String chernobylExternalUrl = 'https://www.un.org/ungifts/chernobyl';
  static const String mosaicExternalUrl =
      'https://streetartcities.com/artists/alexander-kishchenko';
  static const String wikipediaUrl =
      'https://ru.wikipedia.org/wiki/%D0%9A%D0%B8%D1%89%D0%B5%D0%BD%D0%BA%D0%BE,_%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80_%D0%9C%D0%B8%D1%85%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%B8%D1%87';
}
