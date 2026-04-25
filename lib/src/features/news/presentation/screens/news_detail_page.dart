import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/news/data/api/news_api_controller.dart';
import 'package:web_art_galery/src/features/news/data/repository/news_repository_firebase.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_detail_cubit.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.articleId});

  final String articleId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsDetailCubit>(
      create: (_) => NewsDetailCubit(
        repository: NewsRepositoryFirebase(apiController: NewsApiController()),
      )..load(articleId),
      child: _NewsDetailView(articleId: articleId),
    );
  }
}

class _NewsDetailView extends StatelessWidget {
  const _NewsDetailView({required this.articleId});

  final String articleId;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < KSize.adaptiveExpandedBreakpoint;
    final horizontalPadding = isCompact ? KSize.margin6x : KSize.margin12x * 2;

    return Container(
      color: context.colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isCompact ? KSize.margin8x : KSize.margin12x,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _BackButton(),
            const SizedBox(height: KSize.margin5x),
            BlocBuilder<NewsDetailCubit, NewsDetailState>(
              builder: (context, state) {
                return switch (state) {
                  NewsDetailInitial() || NewsDetailLoading() => const _LoadingView(),
                  NewsDetailLoaded(article: final article) =>
                    _ArticleBody(article: article, isCompact: isCompact),
                  NewsDetailMissing() => _MissingView(articleId: articleId),
                  NewsDetailError(message: final message) => _ErrorView(message: message),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/news');
          }
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          size: KSize.iconS,
          color: context.colors.forestGreen,
        ),
        label: Text(
          context.t.newsFeed.back.toUpperCase(),
          style: context.textContent.archiveLink,
        ),
      ),
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

class _MissingView extends StatelessWidget {
  const _MissingView({required this.articleId});

  final String articleId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KSize.margin15x),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.common.pageNotFound,
              style: context.textContent.archiveCardTitle,
            ),
            const SizedBox(height: KSize.margin3x),
            Text(
              articleId,
              style: context.textContent.archiveDate,
            ),
          ],
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
          ],
        ),
      ),
    );
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({required this.article, required this.isCompact});

  final NewsArticle article;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppLocaleCubit>().state.locale;
    final title = article.titleFor(locale);
    final excerpt = article.excerptFor(locale);
    final paragraphs = _splitParagraphs(article.bodyFor(locale));

    // Interleave layout: the first body paragraph acts as the intro, then the
    // horizontal image strip (or an empty gap when there are no images per
    // PRD point 4), then the remaining paragraphs. This keeps the reading
    // rhythm described in the mock: text → images → text → text → text.
    final leadingParagraph = paragraphs.isNotEmpty ? paragraphs.first : null;
    final trailingParagraphs = paragraphs.length > 1
        ? paragraphs.sublist(1)
        : const <String>[];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 860),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.publishedAt != null)
              Text(
                MaterialLocalizations.of(context).formatFullDate(article.publishedAt!),
                style: context.textContent.archiveDate,
              ),
            const SizedBox(height: KSize.margin3x),
            Text(
              title,
              style: context.textContent.archiveSectionTitle.copyWith(
                fontSize: isCompact ? 32 : 40,
              ),
            ),
            if (excerpt.isNotEmpty) ...[
              const SizedBox(height: KSize.margin4x),
              Text(
                excerpt,
                style: context.textContent.bioIntro,
              ),
            ],
            if (leadingParagraph != null) ...[
              const SizedBox(height: KSize.margin6x),
              Text(leadingParagraph, style: context.textContent.bioBody),
            ],
            const SizedBox(height: KSize.margin6x),
            if (article.hasImage)
              _ImageStrip(imageUrls: article.imageUrls, isCompact: isCompact),
            if (trailingParagraphs.isNotEmpty) ...[
              const SizedBox(height: KSize.margin6x),
              _Paragraphs(paragraphs: trailingParagraphs),
            ],
            if (article.hasSourceUrl) ...[
              const SizedBox(height: KSize.margin10x),
              _SourceLink(url: article.sourceUrl!),
            ],
            const SizedBox(height: KSize.margin15x),
          ],
        ),
      ),
    );
  }
}

/// Splits the article body on blank-line paragraph breaks, trimming and
/// discarding empty entries. Shared between the intro paragraph (above the
/// image strip) and the trailing block (below it).
List<String> _splitParagraphs(String body) {
  return body
      .split(RegExp(r'\n\s*\n'))
      .map((p) => p.trim())
      .where((p) => p.isNotEmpty)
      .toList(growable: false);
}

class _ImageStrip extends StatelessWidget {
  const _ImageStrip({required this.imageUrls, required this.isCompact});

  final List<String> imageUrls;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final tileWidth = isCompact ? 260.0 : 360.0;
    final tileHeight = tileWidth * 0.68;

    return SizedBox(
      height: tileHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        separatorBuilder: (_, __) => const SizedBox(width: KSize.margin3x),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
            child: SizedBox(
              width: tileWidth,
              height: tileHeight,
              child: CachedNetworkImageView(
                imagePathOrUrl: imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Stacks the non-leading body paragraphs using the bio body style, matching
/// the typography used on the "About the Author" page.
class _Paragraphs extends StatelessWidget {
  const _Paragraphs({required this.paragraphs});

  final List<String> paragraphs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < paragraphs.length; i++) ...[
          Text(paragraphs[i], style: context.textContent.bioBody),
          if (i != paragraphs.length - 1) const SizedBox(height: KSize.margin4x),
        ],
      ],
    );
  }
}

class _SourceLink extends StatelessWidget {
  const _SourceLink({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: url),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.newsFeed.sourceLabel.toUpperCase(),
              style: context.textContent.archiveLink,
            ),
            const SizedBox(width: KSize.margin2x),
            Flexible(
              child: Text(
                url,
                style: context.textContent.archiveExcerpt,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: KSize.margin1Halfx),
            Icon(
              Icons.arrow_outward_rounded,
              size: KSize.iconSPlus,
              color: context.colors.forestGreen,
            ),
          ],
        ),
      ),
    );
  }
}
