import 'package:web_art_galery/src/features/news/data/api/news_api_controller.dart';
import 'package:web_art_galery/src/features/news/data/mappers/news_firebase_object_mapper.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/domain/repository/news_repository.dart';

class NewsRepositoryFirebase implements NewsRepository {
  NewsRepositoryFirebase({required NewsApiController apiController})
    : _apiController = apiController;

  final NewsApiController _apiController;

  @override
  Future<List<NewsArticle>> fetchAll() async {
    final raw = await _apiController.fetchAll();
    return raw.map((dto) => dto.toDomain()).toList(growable: false);
  }

  @override
  Future<NewsArticle?> fetchById(String id) async {
    final raw = await _apiController.fetchById(id);
    return raw?.toDomain();
  }
}
