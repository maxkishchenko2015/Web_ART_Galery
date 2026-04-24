import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_art_galery/src/features/about_author/data/models/author_photo_firebase_object.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

/// DTO tracking the full `AboutAuthor/{documentId}` Firestore document.
///
/// The document holds an [FirestoreCollections.aboutAuthorItemsField] array
/// of maps, each shaped like `{ "photo": "<url>" }`.
class AboutAuthorFirebaseTracker {
  const AboutAuthorFirebaseTracker({required this.items});

  factory AboutAuthorFirebaseTracker.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data();
    final rawList =
        (data?[FirestoreCollections.aboutAuthorItemsField] as List<dynamic>?) ??
        const <dynamic>[];

    final items = rawList
        .whereType<Map<String, dynamic>>()
        .map(AuthorPhotoFirebaseObject.fromFirestore)
        .where((item) => item.photo.isNotEmpty)
        .toList(growable: false);

    return AboutAuthorFirebaseTracker(items: items);
  }

  final List<AuthorPhotoFirebaseObject> items;

  Map<String, dynamic> toFirestore() => <String, dynamic>{
    FirestoreCollections.aboutAuthorItemsField: items
        .map((item) => item.toFirestore())
        .toList(growable: false),
  };
}
