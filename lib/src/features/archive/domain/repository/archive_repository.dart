import 'package:web_art_galery/src/features/archive/domain/entities/archive_news_item.dart';

/// Read-only catalogue of archive (press / publication) entries.
///
/// Today this is backed by an in-memory list ([ArchiveRepositoryLocal]); the
/// abstraction exists so a future Firestore-backed repository is a single
/// constructor swap in `main.dart`.
abstract class ArchiveRepository {
  Future<List<ArchiveNewsItem>> fetchAll();
}
