import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/models/painting_firebase_object.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

/// Value returned by [CatalogOfWorksApiController.fetchPaintingsPage].
class PaintingsFirebasePage {
  const PaintingsFirebasePage({
    required this.items,
    required this.hasReachedMax,
    required this.nextCursorId,
  });

  final List<PaintingFirebaseObject> items;
  final bool hasReachedMax;
  // The `pictureId` of the last item – used as cursor for the next page.
  final String? nextCursorId;
}

class CatalogOfWorksApiController {
  CatalogOfWorksApiController({FirebaseFirestore? firestore}) : _firestore = firestore;

  final FirebaseFirestore? _firestore;

  /// Fetches [pageSize] paintings from Firestore, starting after [afterCursorId].
  ///
  /// Paintings are stored as individual documents inside:
  ///   `Galery / {paintingsDocumentId} / GaleryItems`
  /// ordered by `pictureId` (lexicographic, matches seed order).
  Future<PaintingsFirebasePage> fetchPaintingsPage({
    required int pageSize,
    String? afterCursorId,
  }) async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    final firestore = _firestore ?? FirebaseFirestore.instance;

    Query<Map<String, dynamic>> query = firestore
        .collection(FirestoreCollections.paintings)
        .doc(FirestoreCollections.paintingsDocumentId)
        .collection(FirestoreCollections.paintingsItemsCollection)
        .orderBy('pictureId')
        .limit(pageSize);

    if (afterCursorId != null && afterCursorId.isNotEmpty) {
      query = query.startAfter(<Object>[afterCursorId]);
    }

    final snapshot = await query.get();
    final items = snapshot.docs
        .map((doc) {
          final data = doc.data();
          // Fall back to the document ID when the `pictureId` field is missing.
          final resolvedId = (data['pictureId'] as String?)?.trim();
          return PaintingFirebaseObject.fromFirestore(<String, dynamic>{
            ...data,
            'pictureId': (resolvedId == null || resolvedId.isEmpty) ? doc.id : resolvedId,
          });
        })
        .toList(growable: false);

    return PaintingsFirebasePage(
      items: items,
      hasReachedMax: items.length < pageSize,
      nextCursorId: items.isEmpty ? null : items.last.pictureId,
    );
  }
}
