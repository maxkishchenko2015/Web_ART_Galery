class FirestoreCollections {
  const FirestoreCollections._();

  static const String paintings = 'Galery';
  static const String paintingsDocumentId = '0hVprkLGCDFeHVJCTGlT';
  // Subcollection used for true Firestore cursor pagination.
  // Each painting is stored as an individual document in this sub-collection.
  static const String paintingsItemsCollection = 'GaleryItems';
  // Legacy array field kept for compatibility with the seed uploader.
  static const String paintingsListField = 'GaleryList';
}
