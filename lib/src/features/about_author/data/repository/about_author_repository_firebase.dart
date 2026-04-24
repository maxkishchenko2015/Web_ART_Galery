import 'package:web_art_galery/src/features/about_author/data/api/about_author_api_controller.dart';
import 'package:web_art_galery/src/features/about_author/domain/entities/author_photo.dart';
import 'package:web_art_galery/src/features/about_author/domain/repository/about_author_repository.dart';

class AboutAuthorRepositoryFirebase implements AboutAuthorRepository {
  AboutAuthorRepositoryFirebase({required AboutAuthorApiController apiController})
    : _apiController = apiController;

  final AboutAuthorApiController _apiController;

  @override
  Future<AboutAuthorPhotos> fetchPhotos() async {
    final rawUrls = await _apiController.fetchPhotos();

    return AboutAuthorPhotos(
      photos: rawUrls.map((url) => AuthorPhoto(url: url)).toList(growable: false),
    );
  }
}
