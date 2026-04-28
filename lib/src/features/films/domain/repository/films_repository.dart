import 'package:flutter/foundation.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';

/// Aggregates the films catalogue exposed by [FilmsRepository].
///
/// The page renders [videos] as the primary "Films & documentaries" section
/// and [reels] as a dedicated short-clips block beneath it.
@immutable
class FilmsCatalogue {
  const FilmsCatalogue({required this.videos, required this.reels});

  final List<Film> videos;
  final List<Film> reels;

  bool get isEmpty => videos.isEmpty && reels.isEmpty;
}

/// Read-only catalogue of films and reels.
///
/// Today this is backed by an in-memory list ([FilmsRepositoryLocal]); the
/// abstraction exists so a future Firestore-backed repository is a single
/// constructor swap in `main.dart`.
abstract class FilmsRepository {
  Future<FilmsCatalogue> load();
}
