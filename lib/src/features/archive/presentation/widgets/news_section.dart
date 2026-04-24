import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  static const double _wideTwoColumnBreakpoint = 1080;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < KSize.adaptiveExpandedBreakpoint;
    final useTwoColumnLayout = width >= _wideTwoColumnBreakpoint;
    final horizontalPadding = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final items = _newsItems()..sort((a, b) => b.date.compareTo(a.date));
    final featured = items.first;
    final secondary = items.skip(1).toList();
    final archiveFeed = context.t.archiveFeed;

    return Container(
      color: context.colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isCompact ? KSize.margin10x : KSize.margin15x,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(archiveFeed.title, style: context.textContent.archiveSectionTitle),
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
              Text(archiveFeed.moreLabel.toUpperCase(), style: context.textContent.archiveMeta),
              Icon(
                Icons.arrow_forward_rounded,
                size: KSize.iconSMedium,
                color: context.colors.forestGreen,
              ),
            ],
          ),
          const SizedBox(height: KSize.margin10x),
          if (!useTwoColumnLayout)
            Column(
              children: [
                _FeaturedNewsCard(item: featured),
                if (secondary.isNotEmpty) const SizedBox(height: KSize.margin8x),
                for (int index = 0; index < secondary.length; index++) ...[
                  _NewsListCard(item: secondary[index]),
                  if (index != secondary.length - 1) const SizedBox(height: KSize.margin6x),
                ],
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: _FeaturedNewsCard(item: featured)),
                const SizedBox(width: KSize.margin8x),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      for (int index = 0; index < secondary.length; index++) ...[
                        _NewsListCard(item: secondary[index]),
                        if (index != secondary.length - 1)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: KSize.margin5x),
                            child: Divider(color: Theme.of(context).dividerColor, height: 1),
                          ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  List<_NewsItem> _newsItems() => [
    _NewsItem(
      title: 'Александр Кищенко. Нити судьбы',
      excerpt:
          'В музее состоялось торжественное открытие выставки «Александр Кищенко. Нити судьбы» (12+), посвященной творчеству выдающегося белорусского художника, уроженца Богучарского района Воронежской области. Выставка организована в честь 300-летия Воронежской губернии, став частью культурного взаимодействия региона с Республикой Беларусь.',
      url: 'https://mkram.ru/ru/2025/07/14/aleksandr-kishhenko-2/',
      date: DateTime(2025, 7, 19),
      host: 'mkram.ru',
      accent: Color(0xFFC97A52),
      accentSecondary: Color(0xFF6B8A63),
    ),
    _NewsItem(
      title: 'Небо и земля Александра Кищенко',
      excerpt:
          '6 мая 2023 года в Национальном художественном музее Республики Беларусь начинает работать выставка «Небо и земля Александра Кищенко», посвященная масштабу его художественного мышления и значению наследия мастера.',
      url: 'https://artmuseum.by/ru/events-news/neba-i-ziamlia-aliaksandra-kishchanki',
      date: DateTime(2023, 5, 6),
      host: 'artmuseum.by',
      accent: Color(0xFF8DAA78),
      accentSecondary: Color(0xFF355743),
    ),
  ];
}

class _FeaturedNewsCard extends StatelessWidget {
  const _FeaturedNewsCard({required this.item});

  final _NewsItem item;

  @override
  Widget build(BuildContext context) {
    final archiveFeed = context.t.archiveFeed;

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
      onTap: () => _openUrl(item.url),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NewsArtwork(item: item, featured: true),
          const SizedBox(height: KSize.margin5x),
          Text(
            archiveFeed.latestLabel.toUpperCase(),
            style: context.textContent.archiveSectionLabel,
          ),
          const SizedBox(height: KSize.margin2x),
          Text(item.title, style: context.textContent.archiveFeaturedTitle),
          const SizedBox(height: KSize.margin3x),
          Text(item.excerpt, style: context.textContent.archiveExcerpt),
          const SizedBox(height: KSize.margin4x),
          _NewsMetaRow(item: item),
        ],
      ),
    );
  }
}

class _NewsListCard extends StatelessWidget {
  const _NewsListCard({required this.item});

  final _NewsItem item;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < KSize.adaptiveExpandedBreakpoint;

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLarge),
      onTap: () => _openUrl(item.url),
      child: isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NewsArtwork(item: item, featured: false),
                const SizedBox(height: KSize.margin4x),
                Text(item.title, style: context.textContent.archiveCardTitle),
                const SizedBox(height: KSize.margin2x),
                Text(
                  item.excerpt,
                  style: context.textContent.archiveExcerpt,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: KSize.margin3x),
                _NewsMetaRow(item: item),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: KSize.newsListArtworkWidth,
                  child: _NewsArtwork(item: item, featured: false),
                ),
                const SizedBox(width: KSize.margin5x),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: KSize.margin1x),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: context.textContent.archiveCardTitle),
                        const SizedBox(height: KSize.margin2x),
                        Text(
                          item.excerpt,
                          style: context.textContent.archiveExcerpt,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: KSize.margin3x),
                        _NewsMetaRow(item: item),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _NewsArtwork extends StatelessWidget {
  const _NewsArtwork({required this.item, required this.featured});

  final _NewsItem item;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final height = featured ? KSize.newsFeaturedArtworkHeight : KSize.newsCardArtworkHeight;

    return ClipRRect(
      borderRadius: BorderRadius.circular(featured ? KSize.radiusLargeExtra : KSize.radiusLarge),
      child: AspectRatio(
        aspectRatio: featured ? 1.22 : 1.45,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [item.accent, item.accentSecondary],
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
                  decoration: BoxDecoration(shape: BoxShape.circle, color: colors.newsGlowLight),
                ),
              ),
              Positioned(
                bottom: -54,
                right: -24,
                child: Container(
                  width: featured ? 210 : 130,
                  height: featured ? 210 : 130,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: colors.newsGlowDark),
                ),
              ),
              Positioned(
                top: featured ? 28 : 20,
                right: featured ? 28 : 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSize.margin3x,
                    vertical: KSize.margin1x,
                  ),
                  decoration: BoxDecoration(
                    color: colors.newsChipFill,
                    borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
                    border: Border.all(color: colors.newsChipBorder),
                  ),
                  child: Text(
                    item.host.toUpperCase(),
                    style: context.textOnDark.footerSitemapLabel,
                  ),
                ),
              ),
              Positioned(
                left: featured ? 28 : 20,
                bottom: featured ? 26 : 18,
                child: Text(
                  item.date.year.toString(),
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
        ),
      ),
    );
  }
}

class _NewsMetaRow extends StatelessWidget {
  const _NewsMetaRow({required this.item});

  final _NewsItem item;

  @override
  Widget build(BuildContext context) {
    final archiveFeed = context.t.archiveFeed;
    final dateLabel = MaterialLocalizations.of(context).formatMediumDate(item.date);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: KSize.margin3x,
      runSpacing: KSize.margin2x,
      children: [
        Text(dateLabel, style: context.textContent.archiveDate),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin2x, vertical: KSize.margin1x),
          decoration: BoxDecoration(
            color: context.colors.bioBg,
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          ),
          child: Text(
            '${archiveFeed.sourceLabel}: ${item.host}',
            style: context.textContent.archiveMeta,
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _openUrl(item.url),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(archiveFeed.openArticle.toUpperCase(), style: context.textContent.archiveLink),
                const SizedBox(width: KSize.margin1Halfx),
                Icon(
                  Icons.arrow_outward_rounded,
                  size: KSize.iconSPlus,
                  color: context.colors.forestGreen,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _openUrl(String rawUrl) async {
  final uri = Uri.parse(rawUrl);
  await launchUrl(uri, webOnlyWindowName: '_blank');
}

class _NewsItem {
  const _NewsItem({
    required this.title,
    required this.excerpt,
    required this.url,
    required this.date,
    required this.host,
    required this.accent,
    required this.accentSecondary,
  });

  final String title;
  final String excerpt;
  final String url;
  final DateTime date;
  final String host;
  final Color accent;
  final Color accentSecondary;
}
