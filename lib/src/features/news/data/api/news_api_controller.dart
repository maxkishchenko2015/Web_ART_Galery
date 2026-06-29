import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/features/news/data/models/news_firebase_object.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';
import 'package:web_art_galery/src/shared/utils/firestore_retry.dart';

/// Thin Firestore wrapper for the `news` collection.
class NewsApiController {
  NewsApiController({FirebaseFirestore? firestore}) : _firestore = firestore;

  final FirebaseFirestore? _firestore;

  CollectionReference<NewsFirebaseObject> _collection() {
    final firestore = _firestore ?? FirebaseFirestore.instance;
    return firestore
        .collection(FirestoreCollections.news)
        .withConverter<NewsFirebaseObject>(
          fromFirestore: NewsFirebaseObject.fromFirestore,
          toFirestore: (article, _) => article.toFirestore(),
        );
  }

  /// Returns every news document ordered by `publishedAt desc`.
  ///
  /// Documents missing `publishedAt` (drafts) are placed after dated ones.
  Future<List<NewsFirebaseObject>> fetchAll() async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    final snapshot = await withFirestoreRetry(
      () => _collection()
          .orderBy(FirestoreCollections.newsPublishedAtField, descending: true)
          .get(),
    );

    return snapshot.docs.map((doc) => doc.data()).toList(growable: false);
  }

  /// Returns a single news document by Firestore id, or `null` when missing.
  Future<NewsFirebaseObject?> fetchById(String id) async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    if (id.trim().isEmpty) return null;

    final snapshot = await withFirestoreRetry(() => _collection().doc(id).get());
    return snapshot.data();
  }
}
