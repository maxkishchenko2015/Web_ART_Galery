class Painting {
  const Painting({
    required this.pictureId,
    required this.name,
    required this.yearOfCreation,
    required this.imageUrl,
    required this.paintedOnAndHow,
    required this.location,
  });

  final String pictureId;
  final String name;
  final int yearOfCreation;
  final String imageUrl;
  final String paintedOnAndHow;
  final String location;

  @override
  String toString() {
    return 'Painting{pictureId: $pictureId, name: $name, yearOfCreation: $yearOfCreation, imageUrl: $imageUrl, paintedOnAndHow: $paintedOnAndHow, location: $location}';
  }
}
