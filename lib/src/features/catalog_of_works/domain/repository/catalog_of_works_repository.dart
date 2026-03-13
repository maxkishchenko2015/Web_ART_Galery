import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';

abstract class CatalogOfWorksRepository {
  Stream<List<Painting>> watchPaintings();
}
