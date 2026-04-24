import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/features/about_author/data/models/about_author_firebase_tracker.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

/// Thin Firestore wrapper that reads the `AboutAuthor` document and returns
/// its photo array as a list of URL strings, ordered by section.
class AboutAuthorApiController {
  AboutAuthorApiController({FirebaseFirestore? firestore}) : _firestore = firestore;

  final FirebaseFirestore? _firestore;

  Future<List<String>> fetchPhotos() async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    final firestore = _firestore ?? FirebaseFirestore.instance;

    final snapshot = await firestore
        .collection(FirestoreCollections.aboutAuthor)
        .doc(FirestoreCollections.aboutAuthorDocumentId)
        .withConverter<AboutAuthorFirebaseTracker>(
          fromFirestore: AboutAuthorFirebaseTracker.fromFirestore,
          toFirestore: (tracker, _) => tracker.toFirestore(),
        )
        .get();

    return snapshot.data()?.items ?? const <String>[];
  }
}
