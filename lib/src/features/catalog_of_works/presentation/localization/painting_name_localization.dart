import 'package:web_art_galery/i18n/strings.g.dart';

class PaintingNameLocalization {
  const PaintingNameLocalization._();

  static String _toLocalizedKey(String pictureId) {
    return 'id${pictureId.replaceAll('.', '_')}';
  }

  static String resolveName(Translations t, String pictureId, {String firebaseName = ''}) {
    final key = _toLocalizedKey(pictureId);
    final localized = t['catalog.paintingNames.$key'];
    if (localized != 'catalog.paintingNames.$key') {
      return localized;
    }

    final normalizedFirebaseName = firebaseName.trim();
    if (normalizedFirebaseName.isNotEmpty) {
      return normalizedFirebaseName;
    }

    return pictureId;
  }
}
