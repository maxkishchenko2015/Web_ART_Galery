import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
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
      return true;
    } catch (error, stackTrace) {
      AppLogger.instance.e('Firebase init skipped', error: error, stackTrace: stackTrace);
      return false;
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
      measurementId: kIsWeb && FirebaseEnvironment.measurementId.isNotEmpty
          ? FirebaseEnvironment.measurementId
          : null,
    );
  }
}
