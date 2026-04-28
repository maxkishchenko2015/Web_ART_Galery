import 'package:web_art_galery/i18n/strings.g.dart';

class PaintingMediumLocalization {
  const PaintingMediumLocalization._();

  static const List<_MediumEntry> _entries = <_MediumEntry>[
    _MediumEntry('Шерсть, лен, ткачество', 'woolLinenWeaving'),
    _MediumEntry('Холст, масло', 'canvasOil'),
    _MediumEntry('ДВП, масло', 'hardboardOil'),
    _MediumEntry('Картон', 'cardboard'),
  ];

  static String resolve(Translations t, String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) {
      return trimmed;
    }
    for (final entry in _entries) {
      if (trimmed == entry.ruValue) {
        return _lookup(t, entry);
      }
      final separator = '${entry.ruValue}, ';
      if (trimmed.startsWith(separator)) {
        final rest = trimmed.substring(separator.length);
        return '${_lookup(t, entry)}, $rest';
      }
    }
    return trimmed;
  }

  static String _lookup(Translations t, _MediumEntry entry) {
    final path = 'catalog.paintingMediums.${entry.key}';
    final localized = t[path];
    if (localized is String && localized != path) {
      return localized;
    }
    return entry.ruValue;
  }
}

class _MediumEntry {
  const _MediumEntry(this.ruValue, this.key);
  final String ruValue;
  final String key;
}
