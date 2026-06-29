// Regenerates `lib/src/shared/config/app_version.dart` from the `version:`
// line in `pubspec.yaml`, dropping the `+B` build suffix.
//
// pubspec is the single source of truth (see the version-bumper skill). This
// keeps the analytics `app_version` constant from drifting — run it from
// `scripts/build_web_seo.sh` before `flutter build web`.
//
//   dart run tool/sync_app_version.dart
import 'dart:io';

void main() {
  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    stderr.writeln('sync_app_version: pubspec.yaml not found (run from repo root).');
    exit(1);
  }

  final versionLine = pubspec.readAsLinesSync().firstWhere(
        (line) => line.startsWith('version:'),
        orElse: () => '',
      );
  if (versionLine.isEmpty) {
    stderr.writeln('sync_app_version: no `version:` line in pubspec.yaml.');
    exit(1);
  }

  // 'version: 26.6.29+1' -> '26.6.29'
  final full = versionLine.split(':')[1].trim();
  final version = full.split('+').first;

  final outFile = File('lib/src/shared/config/app_version.dart');
  final contents = '''abstract final class AppVersion {
  static const String current = '$version';
}
''';
  outFile.writeAsStringSync(contents);
  stdout.writeln('sync_app_version: app_version.dart -> $version');
}
