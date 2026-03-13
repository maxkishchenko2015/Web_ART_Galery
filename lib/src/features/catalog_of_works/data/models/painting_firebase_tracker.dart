import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/models/painting_firebase_object.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

class PaintingFirebaseTracker {
  const PaintingFirebaseTracker({required this.paintings});

  final List<PaintingFirebaseObject> paintings;

  factory PaintingFirebaseTracker.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    final rawList =
        (data?[FirestoreCollections.paintingsListField] as List<dynamic>?) ?? const <dynamic>[];

    final paintings = rawList
        .whereType<Map<String, dynamic>>()
        .map(PaintingFirebaseObject.fromFirestore)
        .toList();

    return PaintingFirebaseTracker(paintings: paintings);
  }

  Map<String, dynamic> toFirestore() {
    return {
      FirestoreCollections.paintingsListField: paintings
          .map((painting) => painting.toFirestore())
          .toList(),
    };
  }
}
