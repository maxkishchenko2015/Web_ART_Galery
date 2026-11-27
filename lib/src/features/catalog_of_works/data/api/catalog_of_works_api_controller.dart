import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/models/painting_firebase_object.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';
import 'package:web_art_galery/src/shared/utils/firestore_retry.dart';

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

  static const Duration _pageTimeout = Duration(seconds: 20);

  /// Fetches [pageSize] paintings from Firestore, starting after [afterCursorId].
  ///
  /// Paintings are stored as individual documents inside:
  ///   `Galery / {paintingsDocumentId} / GaleryItems`
  /// ordered by `pictureId` (lexicographic, matches seed order).
  ///
  /// One extra document is requested as a look-ahead: it tells whether more
  /// pages exist, so the last page is flagged [PaintingsFirebasePage.hasReachedMax]
  /// right away — no trailing request for an empty page (whose spinner used
  /// to hang at the end of the grid when the count was a multiple of
  /// [pageSize]). A request that doesn't answer within [_pageTimeout] fails
  /// instead of leaving the grid loading forever.
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
        .limit(pageSize + 1);

    if (afterCursorId != null && afterCursorId.isNotEmpty) {
      query = query.startAfter(<Object>[afterCursorId]);
    }

    final snapshot = await withFirestoreRetry(query.get).timeout(_pageTimeout);
    final hasMore = snapshot.docs.length > pageSize;
    final items = snapshot.docs
        .take(pageSize)
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
      hasReachedMax: !hasMore,
      nextCursorId: items.isEmpty ? null : items.last.pictureId,
    );
  }

  /// Fetches the paintings whose `pictureId` is in [pictureIds] (at most 30 —
  /// Firestore's `whereIn` limit), sorted by `pictureId` so the order never
  /// depends on the UI language.
  Future<List<PaintingFirebaseObject>> fetchPaintingsByIds(List<String> pictureIds) async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }
    if (pictureIds.isEmpty) return const [];

    final firestore = _firestore ?? FirebaseFirestore.instance;
    final query = firestore
        .collection(FirestoreCollections.paintings)
        .doc(FirestoreCollections.paintingsDocumentId)
        .collection(FirestoreCollections.paintingsItemsCollection)
        .where('pictureId', whereIn: pictureIds);

    final snapshot = await withFirestoreRetry(query.get).timeout(_pageTimeout);
    return snapshot.docs
        .map((doc) => PaintingFirebaseObject.fromFirestore(doc.data()))
        .toList(growable: false)
      ..sort((a, b) => a.pictureId.compareTo(b.pictureId));
  }
}
