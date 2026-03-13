class FirebaseEnvironment {
  const FirebaseEnvironment._();

  static const String apiKey = String.fromEnvironment(
    'FIREBASE_API_KEY',
    defaultValue: 'AIzaSyDoIjh8yogPI2woBPTI8DJswjf2mK4_Tmk',
  );
  static const String appId = String.fromEnvironment(
    'FIREBASE_APP_ID',
    defaultValue: '1:624865429481:web:12ad40ff77547f72186d78',
  );
  static const String messagingSenderId = String.fromEnvironment(
    'FIREBASE_MESSAGING_SENDER_ID',
    defaultValue: '624865429481',
  );
  static const String projectId = String.fromEnvironment(
    'FIREBASE_PROJECT_ID',
    defaultValue: 'kishchenkoart-14257',
  );
  static const String authDomain = String.fromEnvironment(
    'FIREBASE_AUTH_DOMAIN',
    defaultValue: 'kishchenkoart-14257.firebaseapp.com',
  );
  static const String storageBucket = String.fromEnvironment(
    'FIREBASE_STORAGE_BUCKET',
    defaultValue: 'kishchenkoart-14257.firebasestorage.app',
  );
  static const String measurementId = String.fromEnvironment(
    'FIREBASE_MEASUREMENT_ID',
    defaultValue: 'G-4V32QHXZWJ',
  );

  static bool get isConfigured {
    return apiKey.isNotEmpty &&
        appId.isNotEmpty &&
        messagingSenderId.isNotEmpty &&
        projectId.isNotEmpty;
  }
}
