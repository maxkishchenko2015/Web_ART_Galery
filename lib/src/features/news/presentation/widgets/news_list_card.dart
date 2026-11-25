import 'package:material_ui/material_ui.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';

/// Large "Главная новость" card: cover left + copy right on desktop, cover
/// on top on phones / tablets.
class NewsFeaturedCard extends StatelessWidget {
  const NewsFeaturedCard({
    super.key,
    required this.layout,
    required this.article,
    required this.locale,
    required this.onTap,
  });

  final PageLayout layout;
  final NewsArticle article;
  final AppLocale locale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = article.titleFor(locale);
    final excerpt = article.excerptFor(locale);
    final isPhone = layout.isPhone;
    final cover = ClipRRect(
      borderRadius: BorderRadius.circular(KSize.homeCardRadius - KSize.margin1x),
      child: AspectRatio(
        aspectRatio: KSize.newsFeaturedImageAspectRatio,
        child: NewsCover(article: article, semanticLabel: title, large: true),
      ),
    );
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GalleryEyebrow(text: context.t.pages.news.featuredLabel),
        SizedBox(height: isPhone ? KSize.margin2x : KSize.margin4x),
        Text(
          title,
          style: context.textContent.homeTitle(isPhone ? KSize.fontSize2XL : KSize.fontSize3XLHalf),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        if (excerpt.isNotEmpty) ...[
          SizedBox(height: isPhone ? KSize.margin2x : KSize.margin4x),
          Text(
            excerpt,
            style: isPhone ? context.textContent.homeBodyCompact : context.textContent.homeBody,
            maxLines: isPhone ? 3 : 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        SizedBox(height: isPhone ? KSize.margin3x : KSize.margin5x),
        _DateAndLink(article: article, onTap: onTap),
      ],
    );

    return GalleryCard(
      onTap: onTap,
      padding: EdgeInsets.all(isPhone ? KSize.margin3x : KSize.margin4x),
      child: layout.isWide
          ? IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 11, child: Center(child: cover)),
                  const SizedBox(width: KSize.margin8x),
                  Expanded(
                    flex: 12,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: KSize.margin2x),
                      child: copy,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                cover,
                const SizedBox(height: KSize.margin4x),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: KSize.margin1x),
                  child: copy,
                ),
              ],
            ),
    );
  }
}

/// Smaller grid card: cover left + copy right on desktop, cover on top in
/// the two-column phone grid.
class NewsGridCard extends StatelessWidget {
  const NewsGridCard({
    super.key,
    required this.article,
    required this.locale,
    required this.onTap,
    required this.horizontal,
  });

  final NewsArticle article;
  final AppLocale locale;
  final VoidCallback onTap;

  /// Cover beside the copy (desktop rows) instead of above it.
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final title = article.titleFor(locale);
    final date = article.publishedAt;
    final cover = ClipRRect(
      borderRadius: BorderRadius.circular(KSize.homeCardRadius - KSize.margin1x),
      child: AspectRatio(
        aspectRatio: KSize.newsCardImageAspectRatio,
        child: NewsCover(article: article, semanticLabel: title),
      ),
    );
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (date != null) ...[
          Text(
            MaterialLocalizations.of(context).formatMediumDate(date),
            style: context.textContent.cardDate,
          ),
          const SizedBox(height: KSize.margin1Halfx),
        ],
        Text(
          title,
          style: context.textContent.archiveCardTitle,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: KSize.margin3x),
        GalleryArrowLink(label: context.t.common.learnMore, onTap: onTap),
      ],
    );

    return GalleryCard(
      onTap: onTap,
      padding: const EdgeInsets.all(KSize.margin3x),
      child: horizontal
          ? IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 10, child: Center(child: cover)),
                  const SizedBox(width: KSize.margin4x),
                  Expanded(flex: 11, child: Center(child: copy)),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                cover,
                const SizedBox(height: KSize.margin3x),
                copy,
              ],
            ),
    );
  }
}

class _DateAndLink extends StatelessWidget {
  const _DateAndLink({required this.article, required this.onTap});

  final NewsArticle article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final date = article.publishedAt;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: KSize.margin6x,
      runSpacing: KSize.margin2x,
      children: [
        if (date != null)
          Text(
            MaterialLocalizations.of(context).formatMediumDate(date),
            style: context.textContent.cardDate,
          ),
        GalleryArrowLink(label: context.t.common.learnMore, onTap: onTap),
      ],
    );
  }
}

/// News cover image, or the brand gradient with the year when the article
/// has no picture. Fills its parent box.
class NewsCover extends StatelessWidget {
  const NewsCover({super.key, required this.article, this.semanticLabel, this.large = false});

  final NewsArticle article;
  final String? semanticLabel;
  final bool large;

  @override
  Widget build(BuildContext context) {
    if (article.hasImage) {
      return CachedNetworkImageView(
        imagePathOrUrl: article.imageUrls.first,
        width: double.infinity,
        height: double.infinity,
        semanticLabel: semanticLabel,
      );
    }

    final colors = context.colors;
    final year = article.publishedAt?.year;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.terracotta, colors.moss],
        ),
      ),
      child: year == null
          ? const SizedBox.expand()
          : Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(KSize.margin5x),
                child: Text(
                  '$year',
                  style: context.textOnDark
                      .heroHeadline(
                        large ? KSize.archiveFeaturedYearFontSize : KSize.archiveThumbYearFontSize,
                      )
                      .copyWith(color: colors.newsYearFeatured, height: 1),
                ),
              ),
            ),
    );
  }
}
