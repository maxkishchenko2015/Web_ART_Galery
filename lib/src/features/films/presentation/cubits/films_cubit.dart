import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';

/// Sealed state for the Films screen.
///
/// The films catalogue is currently a hardcoded list (no backend), so the
/// state machine is intentionally thin — there is no `Loading` /
/// `Error` variant because [FilmsCubit.load] is synchronous and cannot
/// fail. The sealed/initial split is kept so adding a Firestore-backed
/// repository later is a one-file change.
@immutable
sealed class FilmsState {
  const FilmsState();
}

class FilmsInitial extends FilmsState {
  const FilmsInitial();
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

class FilmsCubit extends Cubit<FilmsState> {
  FilmsCubit() : super(const FilmsInitial());

  /// Synchronously seeds the state with the curated catalogue. Called
  /// once during app bootstrap (`..load()` chained at provider creation).
  ///
  /// Order in the returned lists is the display order — newest /
  /// most-prominent items first.
  void load() {
    emit(FilmsLoaded(videos: _seedVideos(), reels: _seedReels()));
  }

  // ───────────────────────────────────────────────────────────────────
  // Seed data
  //
  // Picks of accent / accentSecondary colors give each card a distinct
  // backdrop while the network thumbnail loads (and provide the only
  // visual when the source has no hotlinkable thumbnail endpoint, e.g.
  // Instagram). Keys are stable identifiers used for analytics and
  // localized copy resolution (`films.items.<key>.{title,excerpt}`).
  // ───────────────────────────────────────────────────────────────────

  List<Film> _seedVideos() => const <Film>[
    Film(
      key: 'aleksandrKishchenko',
      source: FilmSource.youtube,
      videoId: 'o3v8YMdT3kk',
      accent: Color(0xFF8DAA78),
      accentSecondary: Color(0xFF355743),
    ),
    Film(
      key: 'ispovedVremeni',
      source: FilmSource.youtube,
      videoId: 'tL2_OLETMLk',
      accent: Color(0xFFB55A4F),
      accentSecondary: Color(0xFF7A4536),
    ),
    Film(
      key: 'kishchenkoArchive1',
      source: FilmSource.youtube,
      videoId: 'fm5g10z3rL0',
      accent: Color(0xFF6F86A8),
      accentSecondary: Color(0xFF2F4565),
    ),
    Film(
      key: 'kishchenkoArchive2',
      source: FilmSource.youtube,
      videoId: 'ZwFoDh2XYqg',
      accent: Color(0xFFC79256),
      accentSecondary: Color(0xFF7C5429),
    ),
    Film(
      key: 'kishchenkoArchive3',
      source: FilmSource.youtube,
      videoId: 'Trkry-fhvWk',
      accent: Color(0xFF7BA8A3),
      accentSecondary: Color(0xFF335E5A),
    ),
    Film(
      key: 'kishchenkoArchive4',
      source: FilmSource.youtube,
      videoId: 'KthgrqVuqIw',
      accent: Color(0xFF9F7BB8),
      accentSecondary: Color(0xFF513A66),
    ),
    Film(
      key: 'kishchenkoArchive5',
      source: FilmSource.youtube,
      videoId: '7qbdVeWVxOw',
      accent: Color(0xFFB8606E),
      accentSecondary: Color(0xFF6B2F3A),
    ),
    Film(
      key: 'kishchenkoEditedClip',
      source: FilmSource.googleDrive,
      videoId: '1zEnO28XXW5TEE2CT_qCoBUEsfPDRLr0y',
      accent: Color(0xFF7C95C7),
      accentSecondary: Color(0xFF394F87),
    ),
  ];

  List<Film> _seedReels() => const <Film>[
    Film(
      key: 'kishchenkoReel1',
      source: FilmSource.instagram,
      videoId: 'C4-ZbChIN7R',
      accent: Color(0xFFE1306C),
      accentSecondary: Color(0xFF833AB4),
    ),
  ];
}
