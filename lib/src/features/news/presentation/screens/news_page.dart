import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/features/news/presentation/widgets/news_list_card.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) => const _NewsPageView();
}

class _NewsPageView extends StatelessWidget {
  const _NewsPageView();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < KSize.adaptiveExpandedBreakpoint;
    final horizontalPadding = isCompact ? KSize.margin6x : KSize.margin12x * 2;

    return Container(
      color: context.colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isCompact ? KSize.margin10x : KSize.margin15x,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _NewsHeader(),
          const SizedBox(height: KSize.margin10x),
          const _NewsBody(),
        ],
      ),
    );
  }
}

class _NewsHeader extends StatelessWidget {
  const _NewsHeader();

  @override
  Widget build(BuildContext context) {
    final feed = context.t.newsFeed;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(feed.title, style: context.textContent.archiveSectionTitle),
        const SizedBox(height: KSize.margin4x),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: KSize.margin3x,
          runSpacing: KSize.margin2x,
          children: [
            Container(
              width: KSize.newsRuleWidth,
              height: KSize.borderWidthSmallHalf,
              color: Theme.of(context).dividerColor,
            ),
            Text(
              feed.subtitle.toUpperCase(),
              style: context.textContent.archiveMeta,
            ),
          ],
        ),
      ],
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListCubit, NewsListState>(
      builder: (context, state) {
        return switch (state) {
          NewsListInitial() || NewsListLoading() => const _LoadingView(),
          NewsListLoaded(articles: final articles) when articles.isEmpty =>
            const _EmptyView(),
          NewsListLoaded(articles: final articles) => _ArticleList(articles: articles),
          NewsListError(message: final message) => _ErrorView(message: message),
        };
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: KSize.margin15x),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KSize.margin15x),
      child: Center(
        child: Text(
          context.t.newsFeed.emptyState,
          textAlign: TextAlign.center,
          style: context.textContent.archiveExcerpt,
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final feed = context.t.newsFeed;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KSize.margin15x),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(feed.errorTitle, style: context.textContent.archiveCardTitle),
            const SizedBox(height: KSize.margin3x),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: context.textContent.archiveExcerpt,
              ),
            ),
            const SizedBox(height: KSize.margin5x),
            TextButton(
              onPressed: () => context.read<NewsListCubit>().load(),
              child: Text(
                feed.retry.toUpperCase(),
                style: context.textContent.archiveLink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleList extends StatelessWidget {
  const _ArticleList({required this.articles});

  final List<NewsArticle> articles;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppLocaleCubit>().state.locale;
    final width = MediaQuery.sizeOf(context).width;
    final useTwoColumnLayout = width >= KSize.adaptiveTwoColumnBreakpoint;

    if (!useTwoColumnLayout) {
      return Column(
        children: [
          for (int i = 0; i < articles.length; i++) ...[
            NewsListCard(
              article: articles[i],
              locale: locale,
              onTap: () => _openDetail(context, articles[i]),
            ),
            if (!_isLastArticle(i)) const SizedBox(height: KSize.margin6x),
          ],
        ],
      );
    }

    return Wrap(
      spacing: KSize.margin8x,
      runSpacing: KSize.margin8x,
      children: [
        for (final article in articles)
          SizedBox(
            width: (width - KSize.margin12x * 4 - KSize.margin8x) / 2,
            child: NewsListCard(
              article: article,
              locale: locale,
              onTap: () => _openDetail(context, article),
            ),
          ),
      ],
    );
  }

  bool _isLastArticle(int index) => index == articles.length - 1;

  void _openDetail(BuildContext context, NewsArticle article) {
    context.push('/news/${article.id}');
  }
}
