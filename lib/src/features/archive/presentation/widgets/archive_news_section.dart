import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/archive/domain/entities/archive_news_item.dart';
import 'package:web_art_galery/src/features/archive/presentation/cubits/archive_cubit.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class ArchiveNewsSection extends StatelessWidget {
  const ArchiveNewsSection({super.key});

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
      child: BlocBuilder<ArchiveCubit, ArchiveState>(
        builder: (context, state) {
          return switch (state) {
            ArchiveInitial() || ArchiveLoading() => const Center(child: CircularProgressIndicator()),
            ArchiveError(:final message) => Center(
              child: Padding(
                padding: const EdgeInsets.all(KSize.margin4x),
                child: Text(message, textAlign: TextAlign.center),
              ),
            ),
            ArchiveLoaded(:final items) when items.isEmpty => const SizedBox.shrink(),
            ArchiveLoaded(:final items) => _ArchiveContent(items: items, width: width),
          };
        },
      ),
    );
  }
}

class _ArchiveContent extends StatelessWidget {
  const _ArchiveContent({required this.items, required this.width});

  final List<ArchiveNewsItem> items;
  final double width;

  @override
  Widget build(BuildContext context) {
    final useTwoColumnLayout = width >= KSize.adaptiveTwoColumnBreakpoint;
    final sorted = [...items]..sort((a, b) => b.date.compareTo(a.date));
    final featured = sorted.first;
    final secondary = sorted.skip(1).toList();
    final groupedByYear = _groupByYear(secondary);
    final archiveFeed = context.t.archiveFeed;

    return Column(
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
    );
  }

  static List<MapEntry<int, List<ArchiveNewsItem>>> _groupByYear(List<ArchiveNewsItem> items) {
    final byYear = <int, List<ArchiveNewsItem>>{};
    for (final item in items) {
      byYear.putIfAbsent(item.date.year, () => <ArchiveNewsItem>[]).add(item);
    }
    final entries = byYear.entries.toList()..sort((a, b) => b.key.compareTo(a.key));
    return entries;
  }

  List<Widget> _buildYearGroups(
    BuildContext context,
    List<MapEntry<int, List<ArchiveNewsItem>>> groups,
  ) {
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
        final isLastInYearGroup = i == yearItems.length - 1;
        if (!isLastInYearGroup) {
          widgets.add(const SizedBox(height: KSize.margin6x));
        }
      }
    }
    return widgets;
  }
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

  final ArchiveNewsItem item;

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

  final ArchiveNewsItem item;

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

  final ArchiveNewsItem item;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final height = featured ? KSize.newsFeaturedArtworkHeight : KSize.newsCardArtworkHeight;

    return ClipRRect(
      borderRadius: BorderRadius.circular(featured ? KSize.radiusLargeExtra : KSize.radiusLarge),
      child: AspectRatio(
        aspectRatio: featured ? KSize.archiveFeaturedAspectRatio : KSize.archiveRegularAspectRatio,
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
                top: KSize.featuredArtworkGlowOffsetTop,
                left: KSize.featuredArtworkGlowOffsetLeft,
                child: Container(
                  width: featured ? KSize.featuredArtworkGlowLg : KSize.featuredArtworkGlowSm,
                  height: featured ? KSize.featuredArtworkGlowLg : KSize.featuredArtworkGlowSm,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: colors.newsGlowLight),
                ),
              ),
              Positioned(
                bottom: KSize.featuredArtworkGlowOffsetBottom,
                right: KSize.featuredArtworkGlowOffsetRight,
                child: Container(
                  width: featured
                      ? KSize.featuredArtworkGlowDarkLg
                      : KSize.featuredArtworkGlowDarkSm,
                  height: featured
                      ? KSize.featuredArtworkGlowDarkLg
                      : KSize.featuredArtworkGlowDarkSm,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: colors.newsGlowDark),
                ),
              ),
              Positioned(
                top: featured ? KSize.featuredArtworkChipInset : KSize.regularArtworkChipInset,
                right: featured ? KSize.featuredArtworkChipInset : KSize.regularArtworkChipInset,
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
                left: featured
                    ? KSize.featuredArtworkYearInsetX
                    : KSize.regularArtworkYearInsetX,
                bottom: featured
                    ? KSize.featuredArtworkYearInsetY
                    : KSize.regularArtworkYearInsetY,
                child: Text(
                  item.date.year.toString(),
                  style: context.textOnDark
                      .heroHeadline(
                        featured
                            ? KSize.archiveYearFeaturedFontSize
                            : KSize.archiveYearRegularFontSize,
                      )
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

  final ArchiveNewsItem item;

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
