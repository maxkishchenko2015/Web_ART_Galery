import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:web_art_galery/src/features/admin/data/admin_gallery_seed_flow.dart';
import 'package:web_art_galery/src/shared/config/firebase/firebase_bootstrap.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final initialized = await FirebaseBootstrap.tryInitialize();
      if (!initialized) {
        AppLogger.instance.e('Admin seed flow aborted: Firebase not initialized.');
        return;
      }

      final seedFlow = AdminGallerySeedFlow();
      await seedFlow.uploadAllPictures();
      AppLogger.instance.i('Admin seed flow finished successfully.');
    },
    (error, stackTrace) {
      AppLogger.instance.f('Admin seed flow failed', error: error, stackTrace: stackTrace);
    },
  );
}
