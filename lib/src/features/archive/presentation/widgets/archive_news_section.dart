import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class ArchiveNewsSection extends StatelessWidget {
  const ArchiveNewsSection({super.key});

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
    final groupedByYear = _groupByYear(secondary);
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _FeaturedNewsCard(item: featured),
                if (groupedByYear.isNotEmpty) const SizedBox(height: KSize.margin10x),
                ..._buildYearGroups(context, groupedByYear),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildYearGroups(context, groupedByYear),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  static List<MapEntry<int, List<_NewsItem>>> _groupByYear(List<_NewsItem> items) {
    final byYear = <int, List<_NewsItem>>{};
    for (final item in items) {
      byYear.putIfAbsent(item.date.year, () => <_NewsItem>[]).add(item);
    }
    final entries = byYear.entries.toList()..sort((a, b) => b.key.compareTo(a.key));
    return entries;
  }

  List<Widget> _buildYearGroups(BuildContext context, List<MapEntry<int, List<_NewsItem>>> groups) {
    final widgets = <Widget>[];
    for (var groupIndex = 0; groupIndex < groups.length; groupIndex++) {
      final entry = groups[groupIndex];
      if (groupIndex > 0) {
        widgets.add(const SizedBox(height: KSize.margin10x));
      }
      widgets.add(_YearHeading(year: entry.key));
      widgets.add(const SizedBox(height: KSize.margin5x));
      final yearItems = entry.value;
      for (var i = 0; i < yearItems.length; i++) {
        widgets.add(_NewsListCard(item: yearItems[i]));
        if (i != yearItems.length - 1) {
          widgets.add(const SizedBox(height: KSize.margin6x));
        }
      }
    }
    return widgets;
  }

  List<_NewsItem> _newsItems() => [
    _NewsItem(
      key: 'priorbankChtobyChuvstvovat',
      url: 'https://www.priorbank.by/priorbank-main/art',
      date: DateTime(2026, 4, 10),
      host: 'priorbank.by',
      accent: Color(0xFF7C95C7),
      accentSecondary: Color(0xFF394F87),
    ),
    _NewsItem(
      key: 'boguchar2026',
      url: 'https://boguchar.bezformata.com/listnews/ekskursiya-istoriya/156791600/',
      date: DateTime(2026, 2, 19),
      host: 'bezformata.com',
      accent: Color(0xFFB55A4F),
      accentSecondary: Color(0xFF7A4536),
    ),
    _NewsItem(
      key: 'nitiSudby',
      url: 'https://mkram.ru/ru/2025/07/14/aleksandr-kishhenko-2/',
      date: DateTime(2025, 7, 19),
      host: 'mkram.ru',
      accent: Color(0xFFC97A52),
      accentSecondary: Color(0xFF6B8A63),
    ),
    _NewsItem(
      key: 'belgazprombankKraskiPobedy',
      url:
          'https://belgazprombank.by/about/press_centr/novosti_banka/2024/belgazprombank-priglashaet-na-vystavku-kraski-velikoy-pobedy/',
      date: DateTime(2024, 6, 28),
      host: 'belgazprombank.by',
      accent: Color(0xFFC04A4A),
      accentSecondary: Color(0xFF5C2B2B),
    ),
    _NewsItem(
      key: 'boguchar2024',
      url:
          'https://boguchar.bezformata.com/listnews/ekskursiya-istoriya-zhizni-a-m-kishenko/131561835/',
      date: DateTime(2024, 9, 1),
      host: 'bezformata.com',
      accent: Color(0xFFD3A24C),
      accentSecondary: Color(0xFF8E6831),
    ),
    _NewsItem(
      key: 'nebaZiamlja',
      url: 'https://artmuseum.by/ru/events-news/neba-i-ziamlia-aliaksandra-kishchanki',
      date: DateTime(2023, 5, 6),
      host: 'artmuseum.by',
      accent: Color(0xFF8DAA78),
      accentSecondary: Color(0xFF355743),
    ),
  ];
}

class _YearHeading extends StatelessWidget {
  const _YearHeading({required this.year});

  final int year;

  @override
  Widget build(BuildContext context) {
    final yearLabel = context.t.archiveFeed.yearLabel(year: year.toString());
    return Padding(
      padding: const EdgeInsets.only(bottom: KSize.margin1x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(yearLabel.toUpperCase(), style: context.textContent.archiveSectionLabel),
          const SizedBox(width: KSize.margin3x),
          Expanded(
            child: Container(
              height: KSize.borderWidthSmallHalf,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedNewsCard extends StatelessWidget {
  const _FeaturedNewsCard({required this.item});

  final _NewsItem item;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final archiveFeed = t.archiveFeed;

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
          Text(item.localizedTitle(t), style: context.textContent.archiveFeaturedTitle),
          const SizedBox(height: KSize.margin3x),
          Text(item.localizedExcerpt(t), style: context.textContent.archiveExcerpt),
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
    final t = context.t;
    final isCompact = MediaQuery.sizeOf(context).width < KSize.adaptiveExpandedBreakpoint;
    final title = item.localizedTitle(t);
    final excerpt = item.localizedExcerpt(t);

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLarge),
      onTap: () => _openUrl(item.url),
      child: isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NewsArtwork(item: item, featured: false),
                const SizedBox(height: KSize.margin4x),
                Text(title, style: context.textContent.archiveCardTitle),
                const SizedBox(height: KSize.margin2x),
                Text(
                  excerpt,
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
                        Text(title, style: context.textContent.archiveCardTitle),
                        const SizedBox(height: KSize.margin2x),
                        Text(
                          excerpt,
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
    required this.key,
    required this.url,
    required this.date,
    required this.host,
    required this.accent,
    required this.accentSecondary,
  });

  final String key;
  final String url;
  final DateTime date;
  final String host;
  final Color accent;
  final Color accentSecondary;

  String localizedTitle(Translations t) {
    final path = 'archiveFeed.items.$key.title';
    final value = t[path];
    if (value is String && value != path) {
      return value;
    }
    return key;
  }

  String localizedExcerpt(Translations t) {
    final path = 'archiveFeed.items.$key.excerpt';
    final value = t[path];
    if (value is String && value != path) {
      return value;
    }
    return '';
  }
}
