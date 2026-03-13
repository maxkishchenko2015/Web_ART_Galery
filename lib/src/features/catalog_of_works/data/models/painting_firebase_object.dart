class PaintingFirebaseObject {
  const PaintingFirebaseObject({
    required this.pictureId,
    required this.name,
    required this.yearOfCreation,
    required this.imageUrl,
    required this.paintedOnAndHow,
    required this.location,
  });

  factory PaintingFirebaseObject.fromFirestore(Map<String, dynamic> json) {
    final yearRaw = json['year_of_creation'] ?? json['year'];
    final yearOfCreation = yearRaw is num
        ? yearRaw.toInt()
        : int.tryParse(yearRaw?.toString() ?? '') ?? 0;

    return PaintingFirebaseObject(
      pictureId: json['pictureId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      yearOfCreation: yearOfCreation,
      imageUrl: (json['image_url'] ?? json['picture']) as String? ?? '',
      paintedOnAndHow: (json['painted_on_and_how'] ?? json['size']) as String? ?? '',
      location: json['location'] as String? ?? '',
    );
  }

  final String pictureId;
  final String name;
  final int yearOfCreation;
  final String imageUrl;
  final String paintedOnAndHow;
  final String location;

  Map<String, dynamic> toFirestore() {
    return {
      'pictureId': pictureId,
      if (name.isNotEmpty) 'name': name,
      'year': yearOfCreation.toString(),
      'picture': imageUrl,
      'size': paintedOnAndHow,
      if (location.isNotEmpty) 'location': location,
    };
  }
}
