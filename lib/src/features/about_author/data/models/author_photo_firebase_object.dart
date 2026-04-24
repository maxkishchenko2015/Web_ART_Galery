import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';

/// DTO representing a single photo entry stored in Firestore.
///
/// The underlying shape is `{ "photo": "<url>" }`.
class AuthorPhotoFirebaseObject {
  const AuthorPhotoFirebaseObject({required this.photo});

  factory AuthorPhotoFirebaseObject.fromFirestore(Map<String, dynamic> json) {
    final raw = json[FirestoreCollections.aboutAuthorItemPhotoField];
    return AuthorPhotoFirebaseObject(photo: (raw as String?)?.trim() ?? '');
  }

  final String photo;

  Map<String, dynamic> toFirestore() => <String, dynamic>{
    FirestoreCollections.aboutAuthorItemPhotoField: photo,
  };
}
