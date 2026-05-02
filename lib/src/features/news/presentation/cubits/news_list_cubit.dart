import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/domain/repository/news_repository.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

@immutable
sealed class NewsListState {
  const NewsListState();
}

class NewsListInitial extends NewsListState {
  const NewsListInitial();
}

class NewsListLoading extends NewsListState {
  const NewsListLoading();
}

class NewsListLoaded extends NewsListState {
  const NewsListLoaded({required this.articles});

  final List<NewsArticle> articles;

  bool get isEmpty => articles.isEmpty;
}

class NewsListError extends NewsListState {
  const NewsListError(this.message);

  final String message;
}

class NewsListCubit extends Cubit<NewsListState> {
  NewsListCubit({required NewsRepository repository})
    : _repository = repository,
      super(const NewsListInitial());

  final NewsRepository _repository;

  Future<void> load() async {
    if (state is NewsListLoaded) return;
    emit(const NewsListLoading());
    try {
      final articles = await _repository.fetchAll();
      if (articles.isEmpty) {
        AppTelemetry.instance.logEmptyContent(source: 'news_list');
      }
      emit(NewsListLoaded(articles: articles));
    } catch (error, stackTrace) {
      AppLogger.instance.e(
        'News list fetch failed',
        error: error,
        stackTrace: stackTrace,
      );
      AppTelemetry.instance.logFirebaseError(error, stackTrace, reason: 'news_list_fetch');
      emit(NewsListError(error.toString()));
    }
  }
}
