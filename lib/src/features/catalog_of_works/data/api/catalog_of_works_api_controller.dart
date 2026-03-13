import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/models/painting_firebase_object.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/models/painting_firebase_tracker.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

class CatalogOfWorksApiController {
  CatalogOfWorksApiController({FirebaseFirestore? firestore}) : _firestore = firestore;

  final FirebaseFirestore? _firestore;

  Stream<List<PaintingFirebaseObject>> watchPaintings() {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    final firestore = _firestore ?? FirebaseFirestore.instance;
    return firestore
        .collection(FirestoreCollections.paintings)
        .doc(FirestoreCollections.paintingsDocumentId)
        .withConverter<PaintingFirebaseTracker>(
          fromFirestore: PaintingFirebaseTracker.fromFirestore,
          toFirestore: (tracker, _) => tracker.toFirestore(),
        )
        .snapshots()
        .map(
          (documentSnapshot) =>
              documentSnapshot.data()?.paintings ?? const <PaintingFirebaseObject>[],
        );
  }
}
