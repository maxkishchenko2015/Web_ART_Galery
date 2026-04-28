import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/features/films/domain/repository/films_repository.dart';

/// Sealed state for the Films screen.
///
/// `Loading` / `Error` variants are kept thin — today the catalogue is
/// served by a synchronous in-memory repo, but the same cubit will work
/// unchanged once a Firestore-backed repo replaces it.
@immutable
sealed class FilmsState {
  const FilmsState();
}

class FilmsInitial extends FilmsState {
  const FilmsInitial();
}

class FilmsLoading extends FilmsState {
  const FilmsLoading();
}

class FilmsLoaded extends FilmsState {
  const FilmsLoaded({required this.videos, required this.reels});

  /// Long-form films hosted on YouTube and Google Drive — rendered as
  /// the main "Films & documentaries" section on the page.
  final List<Film> videos;

  /// Short Instagram clips — rendered as a dedicated sub-section below
  /// the long-form films.
  final List<Film> reels;

  bool get isEmpty => videos.isEmpty && reels.isEmpty;
}

class FilmsError extends FilmsState {
  const FilmsError({required this.message});

  final String message;
}

class FilmsCubit extends Cubit<FilmsState> {
  FilmsCubit({required FilmsRepository repository})
    : _repository = repository,
      super(const FilmsInitial());

  final FilmsRepository _repository;

  /// Loads the curated catalogue from the injected repository. Called once
  /// during app bootstrap (`..load()` chained at provider creation).
  Future<void> load() async {
    emit(const FilmsLoading());
    try {
      final catalogue = await _repository.load();
      emit(FilmsLoaded(videos: catalogue.videos, reels: catalogue.reels));
    } catch (error) {
      emit(FilmsError(message: error.toString()));
    }
  }
}
