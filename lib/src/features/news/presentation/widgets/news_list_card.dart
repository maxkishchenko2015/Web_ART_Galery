import 'package:flutter/material.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';

/// Single news card used in the list view. Tapping the card forwards to
/// [onTap] — the page is responsible for navigating to the detail route.
class NewsListCard extends StatelessWidget {
  const NewsListCard({
    super.key,
    required this.article,
    required this.locale,
    required this.onTap,
  });

  final NewsArticle article;
  final AppLocale locale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < KSize.adaptiveExpandedBreakpoint;
    final title = article.titleFor(locale);
    final excerpt = article.excerptFor(locale);

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLarge),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(KSize.margin3x),
        child: isCompact
            ? _buildCompact(context, title, excerpt)
            : _buildWide(context, title, excerpt),
      ),
    );
  }

  Widget _buildCompact(BuildContext context, String title, String excerpt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NewsArtwork(article: article, featured: false),
        const SizedBox(height: KSize.margin4x),
        _TextBlock(
          title: title,
          excerpt: excerpt,
          article: article,
          titleStyle: context.textContent.archiveCardTitle,
        ),
      ],
    );
  }

  Widget _buildWide(BuildContext context, String title, String excerpt) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: KSize.newsListArtworkWidth,
          child: _NewsArtwork(article: article, featured: false),
        ),
        const SizedBox(width: KSize.margin5x),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: KSize.margin1x),
            child: _TextBlock(
              title: title,
              excerpt: excerpt,
              article: article,
              titleStyle: context.textContent.archiveCardTitle,
            ),
          ),
        ),
      ],
    );
  }
}

class _TextBlock extends StatelessWidget {
  const _TextBlock({
    required this.title,
    required this.excerpt,
    required this.article,
    required this.titleStyle,
  });

  final String title;
  final String excerpt;
  final NewsArticle article;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        if (excerpt.isNotEmpty) ...[
          const SizedBox(height: KSize.margin2x),
          Text(
            excerpt,
            style: context.textContent.archiveExcerpt,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        const SizedBox(height: KSize.margin3x),
        _MetaRow(article: article),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.article});

  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: KSize.margin3x,
      runSpacing: KSize.margin2x,
      children: [
        if (article.publishedAt != null)
          Text(
            MaterialLocalizations.of(context).formatMediumDate(article.publishedAt!),
            style: context.textContent.archiveDate,
          ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.common.learnMore,
              style: context.textContent.archiveLink,
            ),
            const SizedBox(width: KSize.margin1Halfx),
            Icon(
              Icons.arrow_outward_rounded,
              size: KSize.iconSPlus,
              color: context.colors.forestGreen,
            ),
          ],
        ),
      ],
    );
  }
}

/// Artwork block for a news card. Uses the article's cover image when
/// available, otherwise falls back to the design-system gradient shared
/// with the archive feed so list cards still feel on-brand.
class _NewsArtwork extends StatelessWidget {
  const _NewsArtwork({required this.article, required this.featured});

  final NewsArticle article;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    final radius = featured ? KSize.radiusLargeExtra : KSize.radiusLarge;
    final aspectRatio = featured ? 1.22 : 1.45;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: article.hasImage
            ? CachedNetworkImageView(
                imagePathOrUrl: article.imageUrls.first,
                fit: BoxFit.cover,
              )
            : _GradientFallback(featured: featured, year: article.publishedAt?.year),
      ),
    );
  }
}

class _GradientFallback extends StatelessWidget {
  const _GradientFallback({required this.featured, required this.year});

  final bool featured;
  final int? year;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.forestGreen, colors.darkOlive],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -36,
            left: -26,
            child: Container(
              width: featured ? 180 : 110,
              height: featured ? 180 : 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.newsGlowLight,
              ),
            ),
          ),
          Positioned(
            bottom: -54,
            right: -24,
            child: Container(
              width: featured ? 210 : 130,
              height: featured ? 210 : 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.newsGlowDark,
              ),
            ),
          ),
          if (year != null)
            Positioned(
              left: featured ? 28 : 20,
              bottom: featured ? 26 : 18,
              child: Text(
                year!.toString(),
                style: context.textOnDark
                    .heroHeadline(featured ? 56 : 34)
                    .copyWith(
                      color: featured ? colors.newsYearFeatured : colors.newsYearDefault,
                      height: 1,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
