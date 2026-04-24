import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:web_art_galery/src/features/admin/data/admin_news_seed_flow.dart';
import 'package:web_art_galery/src/shared/config/firebase/firebase_bootstrap.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Dedicated entry point that bootstraps the `news` Firestore collection by
/// writing the template documents defined in [AdminNewsSeedFlow].
///
/// Run once from the command line:
///
/// ```bash
/// flutter run -t lib/main_news_seed.dart
/// ```
///
/// Each run appends new auto-id documents, so only execute it when you want
/// additional templates to appear in the Firebase Console.
Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final initialized = await FirebaseBootstrap.tryInitialize();
      if (!initialized) {
        AppLogger.instance.e('News seed flow aborted: Firebase not initialized.');
        return;
      }

      await AdminNewsSeedFlow().seedTemplates();
      AppLogger.instance.i('News seed flow finished successfully.');
    },
    (error, stackTrace) {
      AppLogger.instance.f('News seed flow failed', error: error, stackTrace: stackTrace);
    },
  );
}
