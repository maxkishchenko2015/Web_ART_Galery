import 'package:url_launcher/url_launcher.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Opens [film] in a new tab (web) / the system browser (native) and logs a
/// `films_card_opened` analytics event.
///
/// [origin] tags *where* the tap came from so the same funnel can be sliced
/// by surface — the Films page (`films_page`, the default) vs. the films
/// strip on the About-the-author page (`about_author`).
Future<void> openFilm(Film film, {String origin = 'films_page'}) async {
  AppTelemetry.instance.logEvent(
    'films_card_opened',
    params: <String, Object?>{
      'key': film.key,
      'video_id': film.videoId,
      'source': film.sourceTag,
      'origin': origin,
    },
  );
  await launchUrl(Uri.parse(film.watchUrl), webOnlyWindowName: '_blank');
}

/// Localized title for [film], resolved via the slang
/// `films.items.<key>.title` path. Falls back to the stable [Film.key] when
/// no translation exists.
String filmTitle(Translations t, Film film) {
  final path = 'films.items.${film.key}.title';
  final value = t[path];
  if (value is String && value != path) {
    return value;
  }
  return film.key;
}

/// Localized excerpt for [film], resolved via the slang
/// `films.items.<key>.excerpt` path. Falls back to an empty string when no
/// translation exists.
String filmExcerpt(Translations t, Film film) {
  final path = 'films.items.${film.key}.excerpt';
  final value = t[path];
  if (value is String && value != path) {
    return value;
  }
  return '';
}
