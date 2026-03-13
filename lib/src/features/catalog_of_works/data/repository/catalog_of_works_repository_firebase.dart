import 'package:web_art_galery/src/features/catalog_of_works/data/api/catalog_of_works_api_controller.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/mappers/painting_firebase_object_mapper.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/repository/catalog_of_works_repository.dart';

class CatalogOfWorksRepositoryFirebase implements CatalogOfWorksRepository {
  CatalogOfWorksRepositoryFirebase({required CatalogOfWorksApiController apiController})
    : _apiController = apiController;

  final CatalogOfWorksApiController _apiController;

  // Tracks the Firestore cursor between pages. Reset to null on page 1.
  String? _lastCursorId;

  @override
  Future<PaintingsPage> fetchPaintingsPage({required int page, required int pageSize}) async {
    if (page <= 1) {
      _lastCursorId = null;
    }

    final result = await _apiController.fetchPaintingsPage(
      pageSize: pageSize,
      afterCursorId: _lastCursorId,
    );
    _lastCursorId = result.nextCursorId;

    return PaintingsPage(
      items: result.items.map((obj) => obj.toDomain()).toList(growable: false),
      page: page,
      hasReachedMax: result.hasReachedMax,
    );
  }
}
