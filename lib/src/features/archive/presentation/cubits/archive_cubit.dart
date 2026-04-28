import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/archive/domain/entities/archive_news_item.dart';
import 'package:web_art_galery/src/features/archive/domain/repository/archive_repository.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

/// Sealed state for the Archive screen.
@immutable
sealed class ArchiveState {
  const ArchiveState();
}

class ArchiveInitial extends ArchiveState {
  const ArchiveInitial();
}

class ArchiveLoading extends ArchiveState {
  const ArchiveLoading();
}

class ArchiveLoaded extends ArchiveState {
  const ArchiveLoaded({required this.items});

  final List<ArchiveNewsItem> items;

  bool get isEmpty => items.isEmpty;
}

class ArchiveError extends ArchiveState {
  const ArchiveError(this.message);

  final String message;
}

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit({required ArchiveRepository repository})
    : _repository = repository,
      super(const ArchiveInitial());

  final ArchiveRepository _repository;

  Future<void> load() async {
    if (state is ArchiveLoaded) return;
    emit(const ArchiveLoading());
    try {
      final items = await _repository.fetchAll();
      emit(ArchiveLoaded(items: items));
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'Archive list fetch failed',
        error: error,
        stackTrace: stackTrace,
      );
      emit(ArchiveError(error.toString()));
    }
  }
}
