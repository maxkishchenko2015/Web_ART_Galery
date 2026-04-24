class FirestoreCollections {
  const FirestoreCollections._();

  static const String paintings = 'Galery';
  static const String paintingsDocumentId = '0hVprkLGCDFeHVJCTGlT';
  // Subcollection used for true Firestore cursor pagination.
  // Each painting is stored as an individual document in this sub-collection.
  static const String paintingsItemsCollection = 'GaleryItems';
  // Legacy array field kept for compatibility with the seed uploader.
  static const String paintingsListField = 'GaleryList';

  // ── About Author ────────────────────────────────────────────────────────
  static const String aboutAuthor = 'AboutAuthor';
  static const String aboutAuthorDocumentId = 'bFn78tk3r6xzDV6fJKbY';
  // Subcollection reserved for per-document author media (currently unused).
  static const String aboutAuthorItemsCollection = 'AuthorItems';
  // Array field on the AboutAuthor document holding `{ photo: String }` maps.
  static const String aboutAuthorItemsField = 'items';
  // Per-item map key that stores the photo URL (or ImageKit path).
  static const String aboutAuthorItemPhotoField = 'photo';
}
