import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/entities/painting.dart';
import 'package:web_art_galery/src/features/catalog_of_works/domain/repository/catalog_of_works_repository.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

@immutable
sealed class CatalogOfWorksState {
  const CatalogOfWorksState();
}

class CatalogOfWorksInitial extends CatalogOfWorksState {
  const CatalogOfWorksInitial();
}

class CatalogOfWorksLoading extends CatalogOfWorksState {
  const CatalogOfWorksLoading();
}

class CatalogOfWorksLoaded extends CatalogOfWorksState {
  const CatalogOfWorksLoaded(this.paintings);

  final List<Painting> paintings;
}

class CatalogOfWorksError extends CatalogOfWorksState {
  const CatalogOfWorksError(this.message);

  final String message;
}

class CatalogOfWorksCubit extends Cubit<CatalogOfWorksState> {
  CatalogOfWorksCubit({required CatalogOfWorksRepository repository})
    : _repository = repository,
      super(const CatalogOfWorksInitial());

  final CatalogOfWorksRepository _repository;
  StreamSubscription<List<Painting>>? _paintingsSubscription;

  Future<void> watchPaintings() async {
    emit(const CatalogOfWorksLoading());

    await _paintingsSubscription?.cancel();
    _paintingsSubscription = _repository.watchPaintings().listen(
      (paintings) {
        AppLogger.instance.i('Paintings loaded: $paintings');
        emit(CatalogOfWorksLoaded(paintings));
      },
      onError: (Object error, StackTrace stackTrace) {
        AppLogger.instance.e('Catalog watch failed', error: error, stackTrace: stackTrace);
        emit(CatalogOfWorksError(error.toString()));
      },
    );
  }

  @override
  Future<void> close() async {
    await _paintingsSubscription?.cancel();
    return super.close();
  }
}
