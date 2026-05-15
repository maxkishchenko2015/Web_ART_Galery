// Build-time SEO generator.
//
// Reads paintings (Galery / GaleryItems) and news (News) from Firestore via
// the public REST API and writes per-document HTML stubs into build/web/
// plus deep-link entries into build/web/sitemap.xml.
//
// Usage (after a `flutter build web --release --pwa-strategy=none` run):
//
//     dart run tool/generate_seo.dart
//
// Env overrides (all optional; defaults match lib/.../firebase_environment.dart):
//
//     FIREBASE_PROJECT_ID=kishchenkoart-14257
//     FIREBASE_API_KEY=AIza...
//     SEO_BUILD_DIR=build/web
//     SEO_BASE_URL=https://kishchanka-art.by
//
// The script is dependency-free: it uses only the Dart standard library so
// it can run in CI without installing the project's Flutter SDK packages.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

// ── Configuration ──────────────────────────────────────────────────────────

const _projectIdEnv = 'FIREBASE_PROJECT_ID';
const _apiKeyEnv = 'FIREBASE_API_KEY';
const _buildDirEnv = 'SEO_BUILD_DIR';
const _baseUrlEnv = 'SEO_BASE_URL';

const _defaultProjectId = 'kishchenkoart-14257';
const _defaultApiKey = 'AIzaSyDoIjh8yogPI2woBPTI8DJswjf2mK4_Tmk';
const _defaultBuildDir = 'build/web';
const _defaultBaseUrl = 'https://kishchanka-art.by';

const _paintingsParentDoc = 'Galery/0hVprkLGCDFeHVJCTGlT';
const _paintingsCollection = 'GaleryItems';
const _newsCollection = 'News';

// ── Entry point ────────────────────────────────────────────────────────────

Future<void> main(List<String> args) async {
  final env = Platform.environment;
  final projectId = env[_projectIdEnv] ?? _defaultProjectId;
  final apiKey = env[_apiKeyEnv] ?? _defaultApiKey;
  final buildDir = Directory(env[_buildDirEnv] ?? _defaultBuildDir);
  final baseUrl = (env[_baseUrlEnv] ?? _defaultBaseUrl).replaceAll(RegExp(r'/$'), '');

  if (!buildDir.existsSync()) {
    stderr.writeln(
      'ERROR: ${buildDir.path} does not exist. '
      'Run `flutter build web --release --pwa-strategy=none` first.',
    );
    exitCode = 1;
    return;
  }

  stdout.writeln('SEO generator');
  stdout.writeln('  project:  $projectId');
  stdout.writeln('  build:    ${buildDir.path}');
  stdout.writeln('  base URL: $baseUrl');

  final client = HttpClient()..connectionTimeout = const Duration(seconds: 30);
  try {
    final paintings = await _fetchPaintings(client, projectId: projectId, apiKey: apiKey);
    final news = await _fetchNews(client, projectId: projectId, apiKey: apiKey);

    stdout.writeln('  paintings: ${paintings.length}');
    stdout.writeln('  news:      ${news.length}');

    for (final painting in paintings) {
      if (painting.pictureId.isEmpty) continue;
      _writePaintingStub(buildDir: buildDir, baseUrl: baseUrl, painting: painting);
    }

    for (final article in news) {
      final slug = article.slug;
      if (slug.isEmpty) continue;
      _writeNewsStub(buildDir: buildDir, baseUrl: baseUrl, article: article);
    }

    _extendSitemap(
      buildDir: buildDir,
      baseUrl: baseUrl,
      paintings: paintings,
      news: news,
    );

    stdout.writeln('Done.');
  } finally {
    client.close(force: true);
  }
}

// ── Firestore REST client ──────────────────────────────────────────────────

Future<List<_Painting>> _fetchPaintings(
  HttpClient client, {
  required String projectId,
  required String apiKey,
}) async {
  final docs = await _listAllDocuments(
    client,
    projectId: projectId,
    apiKey: apiKey,
    collectionPath: '$_paintingsParentDoc/$_paintingsCollection',
  );
  return docs.map(_Painting.fromDocument).toList(growable: false);
}

Future<List<_NewsArticle>> _fetchNews(
  HttpClient client, {
  required String projectId,
  required String apiKey,
}) async {
  final docs = await _listAllDocuments(
    client,
    projectId: projectId,
    apiKey: apiKey,
    collectionPath: _newsCollection,
  );
  return docs.map(_NewsArticle.fromDocument).toList(growable: false);
}

/// Pages through `documents/<path>?key=<apiKey>` until `nextPageToken` clears.
Future<List<Map<String, dynamic>>> _listAllDocuments(
  HttpClient client, {
  required String projectId,
  required String apiKey,
  required String collectionPath,
}) async {
  final all = <Map<String, dynamic>>[];
  String? pageToken;
  do {
    final uri = Uri.https(
      'firestore.googleapis.com',
      '/v1/projects/$projectId/databases/(default)/documents/$collectionPath',
      <String, String>{
        'pageSize': '300',
        'key': apiKey,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );
    final req = await client.getUrl(uri);
    final res = await req.close();
    if (res.statusCode != 200) {
      final body = await res.transform(utf8.decoder).join();
      throw HttpException('Firestore $collectionPath: ${res.statusCode}\n$body');
    }
    final body = await res.transform(utf8.decoder).join();
    final json = jsonDecode(body) as Map<String, dynamic>;
    final documents = (json['documents'] as List?)?.cast<Map<String, dynamic>>() ?? const [];
    all.addAll(documents);
    pageToken = json['nextPageToken'] as String?;
  } while (pageToken != null && pageToken.isNotEmpty);
  return all;
}

/// Firestore typed-value to Dart conversion. Handles the subset of types we
/// actually use in this project (string, integer, double, boolean, timestamp,
/// nullValue, mapValue, arrayValue).
Object? _decodeValue(Map<String, dynamic> raw) {
  if (raw.containsKey('stringValue')) return raw['stringValue'] as String;
  if (raw.containsKey('integerValue')) {
    final v = raw['integerValue'];
    return v is int ? v : int.tryParse(v.toString()) ?? 0;
  }
  if (raw.containsKey('doubleValue')) return (raw['doubleValue'] as num).toDouble();
  if (raw.containsKey('booleanValue')) return raw['booleanValue'] as bool;
  if (raw.containsKey('timestampValue')) return raw['timestampValue'] as String;
  if (raw.containsKey('nullValue')) return null;
  if (raw.containsKey('mapValue')) {
    final fields = (raw['mapValue']['fields'] as Map?)?.cast<String, dynamic>() ?? {};
    return fields.map((k, v) => MapEntry(k, _decodeValue(v as Map<String, dynamic>)));
  }
  if (raw.containsKey('arrayValue')) {
    final values = (raw['arrayValue']['values'] as List?) ?? const [];
    return values
        .map((v) => _decodeValue(v as Map<String, dynamic>))
        .toList(growable: false);
  }
  return null;
}

Map<String, dynamic> _fields(Map<String, dynamic> document) {
  final raw = (document['fields'] as Map?)?.cast<String, dynamic>() ?? const {};
  return raw.map((k, v) {
    return MapEntry(k, _decodeValue(v as Map<String, dynamic>));
  });
}

String _docId(Map<String, dynamic> document) {
  final name = document['name'] as String? ?? '';
  return name.split('/').last;
}

// ── Domain models (mirror Painting / NewsArticle) ──────────────────────────

class _Painting {
  _Painting({
    required this.pictureId,
    required this.name,
    required this.yearOfCreation,
    required this.imageUrl,
    required this.paintedOnAndHow,
    required this.location,
  });

  factory _Painting.fromDocument(Map<String, dynamic> doc) {
    final fields = _fields(doc);
    final yearRaw = fields['year_of_creation'] ?? fields['year'];
    final year = yearRaw is int
        ? yearRaw
        : int.tryParse(yearRaw?.toString() ?? '') ?? 0;
    return _Painting(
      pictureId: (fields['pictureId'] ?? _docId(doc)).toString(),
      name: (fields['name'] ?? '').toString(),
      yearOfCreation: year,
      imageUrl: (fields['image_url'] ?? fields['picture'] ?? '').toString(),
      paintedOnAndHow: (fields['painted_on_and_how'] ?? fields['size'] ?? '').toString(),
      location: (fields['location'] ?? '').toString(),
    );
  }

  final String pictureId;
  final String name;
  final int yearOfCreation;
  final String imageUrl;
  final String paintedOnAndHow;
  final String location;
}

class _NewsArticle {
  _NewsArticle({
    required this.id,
    required this.name,
    required this.publishedAt,
    required this.imageUrls,
    required this.sourceUrl,
    required this.translations,
  });

  factory _NewsArticle.fromDocument(Map<String, dynamic> doc) {
    final fields = _fields(doc);
    final translationsRaw = fields['translations'];
    final translations = <String, Map<String, String>>{};
    if (translationsRaw is Map<String, dynamic>) {
      translationsRaw.forEach((locale, value) {
        if (value is Map) {
          translations[locale] = value.map(
            (k, v) => MapEntry(k.toString(), (v ?? '').toString()),
          );
        }
      });
    }
    final imageUrls = <String>[];
    final urlsRaw = fields['imageUrls'];
    if (urlsRaw is List) {
      for (final url in urlsRaw) {
        if (url is String && url.isNotEmpty) imageUrls.add(url);
      }
    }
    return _NewsArticle(
      id: _docId(doc),
      name: (fields['name'] ?? '').toString(),
      publishedAt: (fields['publishedAt'] ?? '').toString(),
      imageUrls: imageUrls,
      sourceUrl: (fields['sourceUrl'] ?? '').toString(),
      translations: translations,
    );
  }

  final String id;
  final String name;
  final String publishedAt;
  final List<String> imageUrls;
  final String sourceUrl;
  final Map<String, Map<String, String>> translations;

  /// URL segment used for `/news/<slug>`. Prefers the human-readable `name`,
  /// falls back to the Firestore document id (matches NewsArticle.hasName).
  String get slug => name.isNotEmpty ? name : id;

  String titleFor(String locale) =>
      (translations[locale]?['title'] ?? translations['ru']?['title'] ?? '').trim();

  String excerptFor(String locale) =>
      (translations[locale]?['excerpt'] ?? translations['ru']?['excerpt'] ?? '').trim();

  String? get publishedAtIso => publishedAt.isEmpty ? null : publishedAt;
}

// ── HTML stub writers ──────────────────────────────────────────────────────

void _writePaintingStub({
  required Directory buildDir,
  required String baseUrl,
  required _Painting painting,
}) {
  final dir = Directory('${buildDir.path}/catalog/${painting.pictureId}');
  dir.createSync(recursive: true);

  final url = '$baseUrl/catalog/${painting.pictureId}';
  final title = painting.name.isNotEmpty
      ? '${painting.name} (${painting.yearOfCreation}) — Александр Кищенко'
      : 'Работа из каталога — Александр Кищенко';
  final descriptionParts = <String>[
    if (painting.name.isNotEmpty) painting.name,
    if (painting.paintedOnAndHow.isNotEmpty) painting.paintedOnAndHow,
    if (painting.yearOfCreation > 0) '${painting.yearOfCreation} год',
    'из коллекции Александра Михайловича Кищенко',
  ];
  final description = descriptionParts.join(', ');
  final image = painting.imageUrl.isNotEmpty
      ? painting.imageUrl
      : '$baseUrl/icons/Icon-512.png';

  final jsonLd = jsonEncode([
    {
      '@context': 'https://schema.org',
      '@type': 'VisualArtwork',
      'name': painting.name,
      'creator': {'@id': '$baseUrl/#artist'},
      'dateCreated': '${painting.yearOfCreation}',
      'artMedium': painting.paintedOnAndHow,
      'image': image,
      'url': url,
      'inLanguage': 'ru',
      if (painting.location.isNotEmpty) 'locationCreated': painting.location,
    },
    {
      '@context': 'https://schema.org',
      '@type': 'BreadcrumbList',
      'itemListElement': [
        {'@type': 'ListItem', 'position': 1, 'name': 'Главная', 'item': '$baseUrl/'},
        {'@type': 'ListItem', 'position': 2, 'name': 'Каталог работ', 'item': '$baseUrl/catalog'},
        {'@type': 'ListItem', 'position': 3, 'name': painting.name, 'item': url},
      ],
    },
  ]);

  final html = _buildHtml(
    canonicalUrl: url,
    title: title,
    description: description,
    keywords:
        'Кищенко ${painting.name}, ${painting.yearOfCreation}, '
        '${painting.paintedOnAndHow}, белорусская живопись, картина Кищенко',
    ogType: 'article',
    ogImage: image,
    jsonLd: jsonLd,
    hiddenBlock: '''
    <h1>${_escapeHtml(painting.name)} (${painting.yearOfCreation})</h1>
    <p>
      <strong>${_escapeHtml(painting.name)}</strong> — произведение
      <a href="/about-author">Александра Михайловича Кищенко</a>,
      ${_escapeHtml(painting.paintedOnAndHow)},
      ${painting.yearOfCreation} год.
    </p>
    ${painting.location.isNotEmpty ? '<p>Местонахождение: ${_escapeHtml(painting.location)}.</p>' : ''}
    <p><a href="/catalog">Вернуться в каталог</a> · <a href="/about-author">Об авторе</a></p>
''',
  );

  File('${dir.path}/index.html').writeAsStringSync(html);
}

void _writeNewsStub({
  required Directory buildDir,
  required String baseUrl,
  required _NewsArticle article,
}) {
  final dir = Directory('${buildDir.path}/news/${article.slug}');
  dir.createSync(recursive: true);

  final url = '$baseUrl/news/${article.slug}';
  final titleRu = article.titleFor('ru');
  final excerptRu = article.excerptFor('ru');
  final title = titleRu.isNotEmpty ? '$titleRu — КИЩЕНКО-АРТ' : 'Новость — КИЩЕНКО-АРТ';
  final description = excerptRu.isNotEmpty
      ? excerptRu
      : 'Публикация о наследии Александра Кищенко на сайте КИЩЕНКО-АРТ.';
  final image = article.imageUrls.isNotEmpty
      ? article.imageUrls.first
      : '$baseUrl/icons/Icon-512.png';

  final jsonLd = jsonEncode([
    {
      '@context': 'https://schema.org',
      '@type': 'Article',
      'headline': titleRu,
      'description': excerptRu,
      'image': image,
      'mainEntityOfPage': {'@type': 'WebPage', '@id': url},
      'publisher': {'@id': '$baseUrl/#gallery'},
      'author': {'@id': '$baseUrl/#artist'},
      'inLanguage': 'ru',
      if (article.publishedAtIso != null) 'datePublished': article.publishedAtIso,
    },
    {
      '@context': 'https://schema.org',
      '@type': 'BreadcrumbList',
      'itemListElement': [
        {'@type': 'ListItem', 'position': 1, 'name': 'Главная', 'item': '$baseUrl/'},
        {'@type': 'ListItem', 'position': 2, 'name': 'Новости', 'item': '$baseUrl/news'},
        {'@type': 'ListItem', 'position': 3, 'name': titleRu, 'item': url},
      ],
    },
  ]);

  final html = _buildHtml(
    canonicalUrl: url,
    title: title,
    description: description,
    keywords: 'Кищенко новости, выставки Кищенко, $titleRu',
    ogType: 'article',
    ogImage: image,
    jsonLd: jsonLd,
    hiddenBlock: '''
    <h1>${_escapeHtml(titleRu)}</h1>
    ${excerptRu.isNotEmpty ? '<p>${_escapeHtml(excerptRu)}</p>' : ''}
    <p>Источник:
      ${article.sourceUrl.isNotEmpty ? '<a href="${_escapeHtml(article.sourceUrl)}" rel="noopener">оригинал публикации</a>' : 'КИЩЕНКО-АРТ'}.
    </p>
    <p><a href="/news">Вернуться к новостям</a> · <a href="/about-author">Об авторе</a></p>
''',
  );

  File('${dir.path}/index.html').writeAsStringSync(html);
}

/// Renders a stub HTML following the same boilerplate as web/index.html.
/// Keep this template aligned with the per-route stubs in `web/<route>/index.html`.
String _buildHtml({
  required String canonicalUrl,
  required String title,
  required String description,
  required String keywords,
  required String ogType,
  required String ogImage,
  required String jsonLd,
  required String hiddenBlock,
}) {
  final escapedTitle = _escapeHtml(title);
  final escapedDescription = _escapeHtml(description);
  return '''
<!DOCTYPE html>
<html lang="ru">
<head>
  <!--
    Generated by tool/generate_seo.dart. Do not hand-edit — re-run the script
    after the next `flutter build web --release --pwa-strategy=none`.
  -->
  <base href="/">

  <script>
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.getRegistrations().then(function (regs) {
        for (var i = 0; i < regs.length; i++) { regs[i].unregister(); }
      }).catch(function () {});
      if (window.caches && caches.keys) {
        caches.keys().then(function (keys) {
          keys.forEach(function (k) { caches.delete(k); });
        }).catch(function () {});
      }
    }
  </script>

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="theme-color" content="#F5F0E8">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  <title>$escapedTitle</title>
  <meta name="description" content="$escapedDescription">
  <meta name="keywords" content="${_escapeHtml(keywords)}">
  <meta name="author" content="Александр Михайлович Кищенко">
  <meta name="robots" content="index, follow">

  <link rel="canonical" href="${_escapeHtml(canonicalUrl)}">

  <meta property="og:type" content="${_escapeHtml(ogType)}">
  <meta property="og:url" content="${_escapeHtml(canonicalUrl)}">
  <meta property="og:title" content="$escapedTitle">
  <meta property="og:description" content="$escapedDescription">
  <meta property="og:image" content="${_escapeHtml(ogImage)}">
  <meta property="og:locale" content="ru_RU">
  <meta property="og:site_name" content="КИЩЕНКО-АРТ">

  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="$escapedTitle">
  <meta name="twitter:description" content="$escapedDescription">
  <meta name="twitter:image" content="${_escapeHtml(ogImage)}">

  <link rel="apple-touch-icon" href="icons/Icon-192.png">
  <link rel="icon" type="image/png" href="favicon.png"/>

  <script type="application/ld+json">$jsonLd</script>

  <script src="./assets/packages/mixpanel_flutter/assets/mixpanel.js"></script>
</head>
<body>
  <style>
    #flutter-loading { position: fixed; inset: 0; display: flex; flex-direction: column; align-items: center; justify-content: center; background: #F5F0E8; z-index: 9999; transition: opacity 0.4s ease; }
    #flutter-loading.hidden { opacity: 0; pointer-events: none; }
    #flutter-loading-bar-track { width: 160px; height: 2px; background: #E0DBD4; border-radius: 2px; overflow: hidden; margin-top: 24px; }
    #flutter-loading-bar { height: 100%; width: 0%; background: #475F45; border-radius: 2px; animation: flutter-indeterminate 1.6s ease-in-out infinite; }
    #flutter-loading-title { font-family: sans-serif; font-size: 13px; letter-spacing: 3px; color: #7A7E78; margin-top: 16px; }
    @keyframes flutter-indeterminate { 0% { margin-left: -50%; width: 50%; } 50% { margin-left: 50%; width: 50%; } 100% { margin-left: 100%; width: 50%; } }
  </style>
  <div id="flutter-loading">
    <div id="flutter-loading-bar-track"><div id="flutter-loading-bar"></div></div>
    <div id="flutter-loading-title">КИЩЕНКО-АРТ</div>
  </div>
  <script>
    window.addEventListener('flutter-first-frame', function() {
      var el = document.getElementById('flutter-loading');
      if (el) { el.classList.add('hidden'); setTimeout(function() { el.remove(); }, 500); }
    });
  </script>

  <div aria-hidden="true" style="position:absolute;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0)">
$hiddenBlock
  </div>

  <script src="flutter_bootstrap.js" async></script>
</body>
</html>
''';
}

// ── Sitemap extension ──────────────────────────────────────────────────────

void _extendSitemap({
  required Directory buildDir,
  required String baseUrl,
  required List<_Painting> paintings,
  required List<_NewsArticle> news,
}) {
  final file = File('${buildDir.path}/sitemap.xml');
  if (!file.existsSync()) {
    stderr.writeln('WARN: sitemap.xml not found in build dir, skipping.');
    return;
  }
  final original = file.readAsStringSync();
  if (!original.contains('</urlset>')) {
    stderr.writeln('WARN: sitemap.xml missing </urlset>, skipping.');
    return;
  }

  final today = DateTime.now().toUtc().toIso8601String().substring(0, 10);
  final buffer = StringBuffer();
  buffer.writeln('  <!-- Auto-generated deep-link URLs (tool/generate_seo.dart) -->');
  for (final p in paintings) {
    if (p.pictureId.isEmpty) continue;
    final url = '$baseUrl/catalog/${p.pictureId}';
    final img = p.imageUrl.isNotEmpty ? p.imageUrl : '$baseUrl/icons/Icon-512.png';
    buffer
      ..writeln('  <url>')
      ..writeln('    <loc>${_escapeXml(url)}</loc>')
      ..writeln('    <image:image>')
      ..writeln('      <image:loc>${_escapeXml(img)}</image:loc>')
      ..writeln('      <image:title>${_escapeXml(p.name)} (${p.yearOfCreation})</image:title>')
      ..writeln('      <image:caption>${_escapeXml(p.paintedOnAndHow)}</image:caption>')
      ..writeln('    </image:image>')
      ..writeln('    <lastmod>$today</lastmod>')
      ..writeln('    <changefreq>yearly</changefreq>')
      ..writeln('    <priority>0.6</priority>')
      ..writeln('  </url>');
  }
  for (final a in news) {
    final slug = a.slug;
    if (slug.isEmpty) continue;
    final url = '$baseUrl/news/$slug';
    buffer
      ..writeln('  <url>')
      ..writeln('    <loc>${_escapeXml(url)}</loc>');
    if (a.imageUrls.isNotEmpty) {
      buffer
        ..writeln('    <image:image>')
        ..writeln('      <image:loc>${_escapeXml(a.imageUrls.first)}</image:loc>')
        ..writeln('      <image:title>${_escapeXml(a.titleFor('ru'))}</image:title>')
        ..writeln('    </image:image>');
    }
    final iso = a.publishedAtIso;
    buffer
      ..writeln('    <lastmod>${iso != null && iso.length >= 10 ? iso.substring(0, 10) : today}</lastmod>')
      ..writeln('    <changefreq>monthly</changefreq>')
      ..writeln('    <priority>0.7</priority>')
      ..writeln('  </url>');
  }

  final updated = original.replaceFirst('</urlset>', '${buffer.toString()}</urlset>');
  file.writeAsStringSync(updated);
  stdout.writeln('  sitemap:   updated (${paintings.length + news.length} deep-link URLs appended)');
}

// ── Tiny HTML / XML escapers (avoid pulling in package:html_unescape) ──────

String _escapeHtml(String raw) => raw
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#39;');

String _escapeXml(String raw) => raw
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;');
