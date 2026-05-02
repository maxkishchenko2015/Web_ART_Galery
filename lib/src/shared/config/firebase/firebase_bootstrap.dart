import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/shared/config/firebase/firebase_environment.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

class FirebaseBootstrap {
  const FirebaseBootstrap._();

  static Future<bool> tryInitialize() async {
    try {
      if (Firebase.apps.isNotEmpty) {
        return true;
      }

      if (!FirebaseEnvironment.isConfigured) {
        return false;
      }

      await Firebase.initializeApp(options: _options);
      _configureFirestoreForWeb();
      return true;
    } catch (error, stackTrace) {
      AppLogger.instance.e('Firebase init skipped', error: error, stackTrace: stackTrace);
      return false;
    }
  }

  /// Disables IndexedDB persistence and lets the SDK auto-fall back to
  /// long-polling so iOS Safari can fetch data even when WebChannel streaming
  /// is throttled (ITP, mobile carriers, corporate proxies). Without
  /// long-polling auto-detection, Firestore on iOS Safari can hang on every
  /// `.get()`/`.snapshots()` while Android/desktop work fine.
  static void _configureFirestoreForWeb() {
    try {
      FirebaseFirestore.instance.settings = const Settings(
        persistenceEnabled: false,
        webExperimentalAutoDetectLongPolling: true,
      );
    } catch (error, stackTrace) {
      AppLogger.instance.w(
        'Firestore settings override failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static FirebaseOptions get _options {
    return FirebaseOptions(
      apiKey: FirebaseEnvironment.apiKey,
      appId: FirebaseEnvironment.appId,
      messagingSenderId: FirebaseEnvironment.messagingSenderId,
      projectId: FirebaseEnvironment.projectId,
      authDomain: FirebaseEnvironment.authDomain.isEmpty ? null : FirebaseEnvironment.authDomain,
      storageBucket: FirebaseEnvironment.storageBucket.isEmpty
          ? null
          : FirebaseEnvironment.storageBucket,
      measurementId: FirebaseEnvironment.measurementId.isNotEmpty
          ? FirebaseEnvironment.measurementId
          : null,
    );
  }
}
