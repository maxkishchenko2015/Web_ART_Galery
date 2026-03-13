import 'package:web_art_galery/src/features/catalog_of_works/data/api/catalog_of_works_api_controller.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/mappers/painting_firebase_object_mapper.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/repository/catalog_of_works_repository.dart';

class CatalogOfWorksRepositoryFirebase implements CatalogOfWorksRepository {
  CatalogOfWorksRepositoryFirebase({required CatalogOfWorksApiController apiController})
    : _apiController = apiController;

  final CatalogOfWorksApiController _apiController;

  @override
  Stream<List<Painting>> watchPaintings() {
    return _apiController.watchPaintings().map(
      (objects) => objects.map((item) => item.toDomain()).toList(),
    );
  }
}
