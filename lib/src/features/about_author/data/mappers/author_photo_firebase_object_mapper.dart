import 'package:web_art_galery/src/features/about_author/data/models/author_photo_firebase_object.dart';
import 'package:web_art_galery/src/features/about_author/domain/entities/author_photo.dart';

extension AuthorPhotoFirebaseObjectMapper on AuthorPhotoFirebaseObject {
  AuthorPhoto toDomain() => AuthorPhoto(url: photo);
}
