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
  // Array field on the AboutAuthor document holding photo URL strings.
  static const String aboutAuthorItemsField = 'items';

  // ── News ────────────────────────────────────────────────────────────────
  // News articles collection (auto-created on first write). Each document
  // embeds all locale translations in a `translations` map so that
  // editorial content can be updated without an app release. Collection name
  // is PascalCase to stay aligned with `Galery` / `AboutAuthor`.
  static const String news = 'News';

  static const String newsIdField = 'id';
  // URL-safe slug used for human-readable deep links: `/news/<name>`.
  // When unset/empty the app falls back to the Firestore document id so old
  // links keep resolving.
  static const String newsNameField = 'name';
  static const String newsPublishedAtField = 'publishedAt';
  // Array of image URL strings. The list card uses the first entry as the
  // cover; the detail screen renders all entries in a horizontal strip.
  static const String newsImageUrlsField = 'imageUrls';
  static const String newsSourceUrlField = 'sourceUrl';
  static const String newsTranslationsField = 'translations';

  static const String newsTitleField = 'title';
  static const String newsExcerptField = 'excerpt';
  static const String newsBodyField = 'body';
}
