import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';

class PaintingsPage {
  const PaintingsPage({required this.items, required this.page, required this.hasReachedMax});

  final List<Painting> items;
  final int page;
  final bool hasReachedMax;
}

abstract class CatalogOfWorksRepository {
  Future<PaintingsPage> fetchPaintingsPage({required int page, required int pageSize});
}
