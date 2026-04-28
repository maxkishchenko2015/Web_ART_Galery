import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/features/films/domain/repository/films_repository.dart';

/// In-memory [FilmsRepository] backed by a curated, hard-coded catalogue.
///
/// Order in the returned lists is the display order — newest /
/// most-prominent items first. Keys are stable identifiers used for
/// analytics events and localized copy resolution
/// (`films.items.<key>.{title,excerpt}`).
class FilmsRepositoryLocal implements FilmsRepository {
  const FilmsRepositoryLocal();

  @override
  Future<FilmsCatalogue> load() async {
    return const FilmsCatalogue(videos: _videos, reels: _reels);
  }

  static const List<Film> _videos = <Film>[
    Film(
      key: 'aleksandrKishchenko',
      source: FilmSource.youtube,
      videoId: 'o3v8YMdT3kk',
    ),
    Film(
      key: 'ispovedVremeni',
      source: FilmSource.youtube,
      videoId: 'tL2_OLETMLk',
    ),
    Film(
      key: 'kishchenkoArchive1',
      source: FilmSource.youtube,
      videoId: 'fm5g10z3rL0',
    ),
    Film(
      key: 'kishchenkoArchive2',
      source: FilmSource.youtube,
      videoId: 'ZwFoDh2XYqg',
    ),
    Film(
      key: 'kishchenkoArchive3',
      source: FilmSource.youtube,
      videoId: 'Trkry-fhvWk',
    ),
    Film(
      key: 'kishchenkoArchive4',
      source: FilmSource.youtube,
      videoId: 'KthgrqVuqIw',
    ),
    Film(
      key: 'kishchenkoArchive5',
      source: FilmSource.youtube,
      videoId: '7qbdVeWVxOw',
    ),
    Film(
      key: 'kishchenkoEditedClip',
      source: FilmSource.googleDrive,
      videoId: '1zEnO28XXW5TEE2CT_qCoBUEsfPDRLr0y',
    ),
  ];

  static const List<Film> _reels = <Film>[
    Film(
      key: 'kishchenkoReel1',
      source: FilmSource.instagram,
      videoId: 'C4-ZbChIN7R',
    ),
  ];
}
