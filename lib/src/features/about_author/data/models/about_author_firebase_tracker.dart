import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

/// DTO tracking the full `AboutAuthor/{documentId}` Firestore document.
///
/// The document holds an [FirestoreCollections.aboutAuthorItemsField] array
/// of photo URL strings, ordered by the section they belong to.
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
        .whereType<String>()
        .map((url) => url.trim())
        .where((url) => url.isNotEmpty)
        .toList(growable: false);

    return AboutAuthorFirebaseTracker(items: items);
  }

  final List<String> items;

  Map<String, dynamic> toFirestore() => <String, dynamic>{
    FirestoreCollections.aboutAuthorItemsField: items,
  };
}
