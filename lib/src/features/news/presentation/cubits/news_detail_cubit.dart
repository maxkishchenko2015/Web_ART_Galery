import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/domain/repository/news_repository.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

@immutable
sealed class NewsDetailState {
  const NewsDetailState();
}

class NewsDetailInitial extends NewsDetailState {
  const NewsDetailInitial();
}

class NewsDetailLoading extends NewsDetailState {
  const NewsDetailLoading();
}

class NewsDetailLoaded extends NewsDetailState {
  const NewsDetailLoaded({required this.article});

  final NewsArticle article;
}

class NewsDetailMissing extends NewsDetailState {
  const NewsDetailMissing(this.id);

  final String id;
}

class NewsDetailError extends NewsDetailState {
  const NewsDetailError(this.message);

  final String message;
}

class NewsDetailCubit extends Cubit<NewsDetailState> {
  NewsDetailCubit({required NewsRepository repository})
    : _repository = repository,
      super(const NewsDetailInitial());

  final NewsRepository _repository;

  Future<void> load(String id) async {
    emit(const NewsDetailLoading());
    try {
      final article = await _repository.fetchById(id);
      if (article == null) {
        emit(NewsDetailMissing(id));
        return;
      }
      emit(NewsDetailLoaded(article: article));
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'News detail fetch failed (id: $id)',
        error: error,
        stackTrace: stackTrace,
      );
      emit(NewsDetailError(error.toString()));
    }
  }
}
