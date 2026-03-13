import 'package:web_art_galery/src/features/catalog_of_works/data/models/painting_firebase_object.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';

extension PaintingFirebaseObjectMapper on PaintingFirebaseObject {
  Painting toDomain() {
    return Painting(
      pictureId: pictureId,
      name: name,
      yearOfCreation: yearOfCreation,
      imageUrl: imageUrl,
      paintedOnAndHow: paintedOnAndHow,
      location: location,
    );
  }
}
