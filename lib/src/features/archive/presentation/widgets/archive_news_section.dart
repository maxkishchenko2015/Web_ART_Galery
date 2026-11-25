import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/archive/domain/entities/archive_news_item.dart';
import 'package:web_art_galery/src/features/archive/presentation/cubits/archive_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/nav_destinations.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/page_chrome.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';

/// Archive page body: the newest publication as the featured card, the rest
/// grouped by year, a search band (text + year filter, applied to both) and
/// site-section shortcuts.
class ArchiveNewsSection extends StatefulWidget {
  const ArchiveNewsSection({super.key, required this.layout});

  final PageLayout layout;

  @override
  State<ArchiveNewsSection> createState() => _ArchiveNewsSectionState();
}

class _ArchiveNewsSectionState extends State<ArchiveNewsSection> {
  final TextEditingController _query = TextEditingController();
  int? _year;

  @override
  void initState() {
    super.initState();
    _query.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  bool _matches(Translations t, ArchiveNewsItem item) {
    if (_year != null && item.date.year != _year) return false;
    final query = _query.text.trim().toLowerCase();
    if (query.isEmpty) return true;
    final haystack = '${item.localizedTitle(t)} ${item.localizedExcerpt(t)} ${item.host}'
        .toLowerCase();
    return haystack.contains(query);
  }

  @override
  Widget build(BuildContext context) {
    final layout = widget.layout;

    return BlocBuilder<ArchiveCubit, ArchiveState>(
      builder: (context, state) {
        if (state is ArchiveInitial || state is ArchiveLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: KSize.margin15x),
            child: Center(child: AppLoader()),
          );
        }
        final items = state is ArchiveLoaded
            ? ([...state.items]..sort((a, b) => b.date.compareTo(a.date)))
            : const <ArchiveNewsItem>[];
        if (items.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: KSize.margin15x),
            child: Icon(
              Icons.inventory_2_outlined,
              size: KSize.iconHeroPlaceholder,
              color: context.colors.contentMuted.withValues(alpha: 0.5),
            ),
          );
        }

        final t = context.t;
        final years = items.map((e) => e.date.year).toSet().toList()..sort((a, b) => b - a);
        final filtered = items.where((item) => _matches(t, item)).toList();
        // Keyed so the text field keeps focus while results reshuffle.
        final searchBand = _SearchBand(
          key: const ValueKey('archive-search'),
          layout: layout,
          controller: _query,
          years: years,
          selectedYear: _year,
          onYearChanged: (year) => setState(() => _year = year),
        );
        final sections = Padding(
          padding: EdgeInsets.fromLTRB(
            layout.gutter,
            layout.sectionGap,
            layout.gutter,
            layout.sectionGap,
          ),
          child: _SiteSections(layout: layout),
        );
        EdgeInsets padded({bool bottom = true}) => EdgeInsets.fromLTRB(
          layout.gutter,
          layout.sectionGap,
          layout.gutter,
          bottom ? layout.sectionGap + KSize.margin2x : 0,
        );

        if (filtered.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: padded(),
                child: Text(
                  t.pages.archive.noResults,
                  style: context.textContent.homeBody,
                  textAlign: TextAlign.center,
                ),
              ),
              searchBand,
              sections,
            ],
          );
        }

        final featured = _FeaturedArchiveCard(layout: layout, item: filtered.first);
        final rest = filtered.skip(1).toList();
        final groups = rest.isEmpty ? null : _YearGroups(layout: layout, items: rest);

        if (layout.isWide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: padded(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 11, child: featured),
                    if (groups != null) ...[
                      const SizedBox(width: KSize.margin7x),
                      Expanded(flex: 13, child: groups),
                    ],
                  ],
                ),
              ),
              searchBand,
              sections,
            ],
          );
        }

        // Phones / tablets follow the mobile design: featured item, search,
        // then the archive by year.
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: padded(), child: featured),
            searchBand,
            if (groups != null)
              Padding(
                padding: padded(bottom: false),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SectionHeading(text: t.pages.archive.byYears),
                    const SizedBox(height: KSize.margin4x),
                    groups,
                  ],
                ),
              ),
            sections,
          ],
        );
      },
    );
  }
}

Future<void> _openItem(ArchiveNewsItem item) async {
  final uri = Uri.tryParse(item.url);
  if (uri == null) return;
  await launchUrl(uri, webOnlyWindowName: '_blank');
}

// ─── Featured item ───────────────────────────────────────────────────────────

class _FeaturedArchiveCard extends StatelessWidget {
  const _FeaturedArchiveCard({required this.layout, required this.item});

  final PageLayout layout;
  final ArchiveNewsItem item;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isPhone = layout.isPhone;
    final excerpt = item.localizedExcerpt(t);
    final art = ClipRRect(
      borderRadius: BorderRadius.circular(KSize.homeCardRadius - KSize.margin1x),
      child: AspectRatio(
        aspectRatio: layout.isWide ? 4 / 3 : 2.2,
        child: _ArchiveArtwork(item: item, large: true),
      ),
    );
    final meta = Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: KSize.margin4x,
      runSpacing: KSize.margin2x,
      children: [
        Text(
          MaterialLocalizations.of(context).formatMediumDate(item.date),
          style: context.textContent.cardDate,
        ),
        GalleryTagChip(label: '${t.archiveFeed.sourceLabel}: ${item.host}'),
      ],
    );
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GalleryEyebrow(text: t.pages.archive.featuredLabel, showRule: !isPhone),
        const SizedBox(height: KSize.margin3x),
        Text(
          item.localizedTitle(t),
          style: context.textContent.homeTitle(isPhone ? KSize.fontSize2XL : KSize.fontSize3XL),
        ),
        if (excerpt.isNotEmpty) ...[
          const SizedBox(height: KSize.margin3x),
          Text(
            excerpt,
            style: isPhone ? context.textContent.homeBodyCompact : context.textContent.homeBody,
            maxLines: isPhone ? 3 : 6,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        const SizedBox(height: KSize.margin4x),
        meta,
        const SizedBox(height: KSize.margin4x),
        GalleryArrowLink(label: t.archiveFeed.openArticle, onTap: () => _openItem(item)),
      ],
    );

    return GalleryCard(
      onTap: () => _openItem(item),
      padding: EdgeInsets.all(isPhone ? KSize.margin3x : KSize.margin4x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          art,
          const SizedBox(height: KSize.margin5x),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isPhone ? KSize.margin1x : KSize.margin2x),
            child: copy,
          ),
        ],
      ),
    );
  }
}

// ─── Year groups ─────────────────────────────────────────────────────────────

class _YearGroups extends StatelessWidget {
  const _YearGroups({required this.layout, required this.items});

  final PageLayout layout;

  /// Newest first.
  final List<ArchiveNewsItem> items;

  @override
  Widget build(BuildContext context) {
    final byYear = <int, List<ArchiveNewsItem>>{};
    for (final item in items) {
      byYear.putIfAbsent(item.date.year, () => []).add(item);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, entry) in byYear.entries.indexed) ...[
          if (index > 0) const SizedBox(height: KSize.margin6x),
          _YearHeading(year: entry.key),
          const SizedBox(height: KSize.margin3x),
          for (final (i, item) in entry.value.indexed) ...[
            if (i > 0) SizedBox(height: layout.isPhone ? KSize.margin3x : KSize.margin4x),
            _ArchiveRow(layout: layout, item: item),
          ],
        ],
      ],
    );
  }
}

class _YearHeading extends StatelessWidget {
  const _YearHeading({required this.year});

  final int year;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.t.archiveFeed.yearLabel(year: year).toUpperCase(),
          style: context.textContent.yearHeading,
        ),
        const SizedBox(width: KSize.margin4x),
        Expanded(child: Divider(color: context.colors.parchmentLine)),
      ],
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: context.textContent.homeTitle(KSize.fontSize2XL)),
        const SizedBox(width: KSize.margin4x),
        Expanded(child: Divider(color: context.colors.parchmentLine)),
      ],
    );
  }
}

class _ArchiveRow extends StatelessWidget {
  const _ArchiveRow({required this.layout, required this.item});

  final PageLayout layout;
  final ArchiveNewsItem item;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isPhone = layout.isPhone;
    final excerpt = item.localizedExcerpt(t);

    return GalleryCard(
      onTap: () => _openItem(item),
      padding: const EdgeInsets.all(KSize.margin3x),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: isPhone ? 5 : 4,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(KSize.radiusDefaultSmall),
                  child: AspectRatio(
                    aspectRatio: KSize.archiveThumbAspectRatio,
                    child: _ArchiveArtwork(item: item, large: false),
                  ),
                ),
              ),
            ),
            SizedBox(width: isPhone ? KSize.margin3x : KSize.margin5x),
            Expanded(
              flex: isPhone ? 7 : 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.localizedTitle(t),
                    style: context.textContent.homeTitle(
                      isPhone ? KSize.fontSizeS : KSize.fontSizeML,
                    ),
                    maxLines: isPhone ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (excerpt.isNotEmpty) ...[
                    const SizedBox(height: KSize.margin1Halfx),
                    Text(
                      excerpt,
                      style: context.textContent.quickLinkSubtitle,
                      maxLines: isPhone ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: KSize.margin2x),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: KSize.margin3x,
                    runSpacing: KSize.margin1x,
                    children: [
                      Text(
                        MaterialLocalizations.of(context).formatMediumDate(item.date),
                        style: context.textContent.cardDate,
                      ),
                      if (!isPhone)
                        GalleryTagChip(label: '${t.archiveFeed.sourceLabel}: ${item.host}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: KSize.margin2x),
            Center(
              child: Icon(
                Icons.arrow_forward_rounded,
                size: KSize.iconMS,
                color: context.colors.terracotta,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Gradient artwork with the publication year — archive items carry no
/// pictures, each has its own accent pair instead.
class _ArchiveArtwork extends StatelessWidget {
  const _ArchiveArtwork({required this.item, required this.large});

  final ArchiveNewsItem item;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final glow = large ? KSize.featuredArtworkGlowLg : KSize.featuredArtworkGlowSm;

    return DecoratedBox(
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
            top: -glow * 0.2,
            right: -glow * 0.15,
            width: glow,
            height: glow,
            child: DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, color: colors.newsGlowLight),
            ),
          ),
          Positioned(
            bottom: -glow * 0.35,
            left: glow * 0.4,
            width: glow * 1.2,
            height: glow * 1.2,
            child: DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, color: colors.newsGlowDark),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(large ? KSize.margin6x : KSize.margin3x),
              child: Text(
                '${item.date.year}',
                style: context.textOnDark
                    .heroHeadline(
                      large ? KSize.archiveFeaturedYearFontSize : KSize.archiveThumbYearFontSize,
                    )
                    .copyWith(color: colors.newsYearFeatured, height: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Search band ─────────────────────────────────────────────────────────────

class _SearchBand extends StatelessWidget {
  const _SearchBand({
    super.key,
    required this.layout,
    required this.controller,
    required this.years,
    required this.selectedYear,
    required this.onYearChanged,
  });

  final PageLayout layout;
  final TextEditingController controller;
  final List<int> years;
  final int? selectedYear;
  final ValueChanged<int?> onYearChanged;

  @override
  Widget build(BuildContext context) {
    final t = context.t.pages.archive;
    final colors = context.colors;
    final field = TextField(
      controller: controller,
      style: context.textContent.inputText,
      cursorColor: colors.terracotta,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        isDense: true,
        hintText: t.searchHint,
        hintStyle: context.textContent.inputHint,
        prefixIcon: Icon(Icons.search_rounded, color: colors.terracotta),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: controller.clear,
                icon: Icon(Icons.close_rounded, size: KSize.iconMS, color: colors.contentMuted),
              ),
        filled: true,
        fillColor: colors.parchment,
        contentPadding: const EdgeInsets.symmetric(vertical: KSize.margin4x),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          borderSide: BorderSide(color: colors.parchmentLine),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          borderSide: BorderSide(color: colors.parchmentLine),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          borderSide: BorderSide(color: colors.terracotta),
        ),
      ),
    );
    final yearPicker = _YearPicker(
      years: years,
      selectedYear: selectedYear,
      onChanged: onYearChanged,
    );

    return GalleryBand(
      layout: layout,
      title: t.searchTitle,
      body: t.searchBody,
      card: Padding(
        padding: EdgeInsets.symmetric(vertical: layout.isPhone ? KSize.margin3x : 0),
        child: layout.isPhone
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  field,
                  const SizedBox(height: KSize.margin3x),
                  yearPicker,
                ],
              )
            : Row(
                children: [
                  Expanded(child: field),
                  const SizedBox(width: KSize.margin6x),
                  SizedBox(width: KSize.floatingMenuMinWidth, child: yearPicker),
                ],
              ),
      ),
    );
  }
}

class _YearPicker extends StatelessWidget {
  const _YearPicker({required this.years, required this.selectedYear, required this.onChanged});

  final List<int> years;
  final int? selectedYear;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = context.textContent.startRouteTitle;

    return Row(
      children: [
        Icon(Icons.calendar_month_outlined, color: colors.terracotta, size: KSize.iconL - 4),
        const SizedBox(width: KSize.margin3x),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int?>(
              value: selectedYear,
              isExpanded: true,
              dropdownColor: colors.parchmentCard,
              borderRadius: BorderRadius.circular(KSize.radiusDefaultMedium),
              icon: Icon(Icons.keyboard_arrow_down_rounded, color: colors.darkText),
              style: style,
              items: [
                DropdownMenuItem<int?>(
                  value: null,
                  child: Text(context.t.pages.archive.allYears, style: style),
                ),
                for (final year in years)
                  DropdownMenuItem<int?>(
                    value: year,
                    child: Text('$year', style: style),
                  ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Site sections ───────────────────────────────────────────────────────────

class _SiteSections extends StatelessWidget {
  const _SiteSections({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final newsState = context.watch<NewsListCubit>().state;
    final catalogState = context.watch<CatalogOfWorksCubit>().state;

    return GalleryQuickLinks(
      layout: layout,
      links: [
        if (!NavVisibility.newsIsSettledEmpty(newsState))
          GalleryQuickLink(
            title: t.navigation.news,
            subtitle: t.home.links.news,
            icon: Icons.article_outlined,
            onTap: () => context.go(AppRoutes.news),
          ),
        if (!NavVisibility.catalogIsSettledEmpty(catalogState))
          GalleryQuickLink(
            title: t.navigation.catalogOfWorks,
            subtitle: t.home.links.catalog,
            icon: Icons.image_outlined,
            onTap: () => context.go(AppRoutes.catalog),
          ),
        GalleryQuickLink(
          title: t.navigation.films,
          subtitle: t.home.links.films,
          icon: Icons.smart_display_outlined,
          onTap: () => context.go(AppRoutes.films),
        ),
        GalleryQuickLink(
          title: t.navigation.contacts,
          subtitle: t.contacts.tagline,
          icon: Icons.mail_outline_rounded,
          onTap: () => context.go(AppRoutes.contacts),
        ),
      ],
    );
  }
}
