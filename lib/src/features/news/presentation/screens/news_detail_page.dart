import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cubit_initializer.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.articleSlug});

  /// URL segment captured by GoRouter — either the editorial `name` slug or
  /// (for legacy links) a raw Firestore document id. Resolution happens
  /// against the already-loaded [NewsListCubit] state, so the detail screen
  /// never issues its own Firestore request.
  final String articleSlug;

  @override
  Widget build(BuildContext context) {
    // A deep link straight to /news/<slug> can land here before the list has
    // ever loaded (it is no longer fetched at app start), so ensure the list
    // load is triggered — the cubit's `is Loaded` guard keeps it a no-op when
    // the user arrived from the news list. Resolution still happens against the
    // list state, so the detail screen issues no Firestore request of its own.
    return CubitInitializer(
      onInit: (context) => context.read<NewsListCubit>().load(),
      child: _NewsDetailView(articleSlug: articleSlug),
    );
  }
}

class _NewsDetailView extends StatelessWidget {
  const _NewsDetailView({required this.articleSlug});

  final String articleSlug;

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
            BlocBuilder<NewsListCubit, NewsListState>(
              builder: (context, state) {
                return switch (state) {
                  NewsListInitial() || NewsListLoading() => const _LoadingView(),
                  // List-level error => detail can't render anything useful;
                  // fall through to "not found" instead of bubbling raw
                  // Firestore strings into a content surface.
                  NewsListError() => _MissingView(articleSlug: articleSlug),
                  NewsListLoaded(articles: final articles) => _resolve(
                    articles: articles,
                    isCompact: isCompact,
                  ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _resolve({
    required List<NewsArticle> articles,
    required bool isCompact,
  }) {
    final match = _findArticle(articles, articleSlug);
    if (match == null) {
      return _MissingView(articleSlug: articleSlug);
    }
    return _ArticleBody(article: match, isCompact: isCompact);
  }
}

/// Resolves the article for the current URL segment.
///
/// Order of preference:
///  1. `name == slug` — the human-readable URL form editors curate.
///  2. `id == slug` — legacy `/news/<docId>` deep links still must resolve.
///
/// Returns `null` for an empty slug or when neither lookup matches.
NewsArticle? _findArticle(List<NewsArticle> articles, String slug) {
  if (slug.isEmpty) return null;

  for (final article in articles) {
    if (article.hasName && article.name == slug) return article;
  }
  for (final article in articles) {
    if (article.id == slug) return article;
  }
  return null;
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
            context.go(AppRoutes.news);
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
      child: Center(child: AppLoader()),
    );
  }
}

class _MissingView extends StatelessWidget {
  const _MissingView({required this.articleSlug});

  final String articleSlug;

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
              articleSlug,
              style: context.textContent.archiveDate,
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
            Text(
              title,
              style: context.textContent.archiveSectionTitle.copyWith(
                fontSize: isCompact ? 32 : 40,
              ),
            ),
            const SizedBox(height: KSize.margin5x),
            _ArticleStats(
              article: article,
              locale: locale,
              isCompact: isCompact,
            ),
            if (excerpt.isNotEmpty) ...[
              const SizedBox(height: KSize.margin6x),
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
              _ImageGallery(imageUrls: article.imageUrls, isCompact: isCompact),
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

/// Hosts the horizontal thumbnail strip together with an inline expanded
/// preview panel. Tapping a thumbnail toggles a full-size view of that
/// image directly below the strip.
class _ImageGallery extends StatefulWidget {
  const _ImageGallery({required this.imageUrls, required this.isCompact});

  final List<String> imageUrls;
  final bool isCompact;

  @override
  State<_ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<_ImageGallery> {
  int? _selectedIndex;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }

  void _close() {
    setState(() => _selectedIndex = null);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ImageStrip(
          imageUrls: widget.imageUrls,
          isCompact: widget.isCompact,
          selectedIndex: selectedIndex,
          onTap: _onTap,
        ),
        AnimatedSize(
          duration: KSize.durationMedium,
          alignment: Alignment.topCenter,
          curve: Curves.easeInOut,
          child: selectedIndex == null
              ? const SizedBox(width: double.infinity)
              : Padding(
                  padding: const EdgeInsets.only(top: KSize.margin4x),
                  child: _ExpandedImagePanel(
                    imageUrl: widget.imageUrls[selectedIndex],
                    isCompact: widget.isCompact,
                    onClose: _close,
                  ),
                ),
        ),
      ],
    );
  }
}

/// Horizontal thumbnail strip. Owns its own [ScrollController] so the
/// gallery can wire up mouse-wheel scrolling and a custom [ScrollBehavior]
/// that enables drag-to-scroll with mouse / trackpad on Flutter web.
class _ImageStrip extends StatefulWidget {
  const _ImageStrip({
    required this.imageUrls,
    required this.isCompact,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<String> imageUrls;
  final bool isCompact;
  final int? selectedIndex;
  final ValueChanged<int> onTap;

  @override
  State<_ImageStrip> createState() => _ImageStripState();
}

class _ImageStripState extends State<_ImageStrip> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent || !_controller.hasClients) return;
    final delta = event.scrollDelta.dy != 0 ? event.scrollDelta.dy : event.scrollDelta.dx;
    if (delta == 0) return;
    final position = _controller.position;
    final target = (position.pixels + delta).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    _controller.jumpTo(target);
  }

  @override
  Widget build(BuildContext context) {
    final tileWidth = widget.isCompact ? 260.0 : 360.0;
    final tileHeight = tileWidth * 0.68;

    return SizedBox(
      height: tileHeight,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          dragDevices: const {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.stylus,
          },
        ),
        child: Listener(
          onPointerSignal: _handlePointerSignal,
          child: ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.imageUrls.length,
            separatorBuilder: (_, _) => const SizedBox(width: KSize.margin3x),
            itemBuilder: (context, index) {
              final isSelected = widget.selectedIndex == index;
              final radius = BorderRadius.circular(KSize.radiusLargeExtra);

              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onTap(index),
                  child: AnimatedContainer(
                    duration: KSize.durationFast,
                    width: tileWidth,
                    height: tileHeight,
                    decoration: BoxDecoration(
                      borderRadius: radius,
                      border: Border.all(
                        color: isSelected
                            ? context.colors.forestGreen
                            : Colors.transparent,
                        width: KSize.borderWidthSmall,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: radius,
                      child: CachedNetworkImageView(
                        imagePathOrUrl: widget.imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Inline full-size view of the currently selected thumbnail. Scales to
/// the available width and is constrained vertically so it never blows
/// past the article column on tall portraits.
class _ExpandedImagePanel extends StatelessWidget {
  const _ExpandedImagePanel({
    required this.imageUrl,
    required this.isCompact,
    required this.onClose,
  });

  final String imageUrl;
  final bool isCompact;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final maxHeight = isCompact ? 360.0 : 540.0;
    final radius = BorderRadius.circular(KSize.radiusLargeExtra);

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: ClipRRect(
        borderRadius: radius,
        child: Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(
                color: context.colors.bioBg,
                child: CachedNetworkImageView(
                  imagePathOrUrl: imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: KSize.margin2x,
              right: KSize.margin2x,
              child: Material(
                color: context.colors.darkOlive.withValues(alpha: 0.72),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onClose,
                  child: Padding(
                    padding: const EdgeInsets.all(KSize.margin1Halfx),
                    child: Icon(
                      Icons.close_rounded,
                      size: KSize.iconSMedium,
                      color: context.colors.onDark,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
          if (!_isLastParagraph(i)) const SizedBox(height: KSize.margin4x),
        ],
      ],
    );
  }

  bool _isLastParagraph(int index) => index == paragraphs.length - 1;
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

/// Reading time / view count / publish-date row rendered beneath the
/// article body. View count is intentionally hardcoded for now; once a
/// real analytics hook lands it should be sourced from [NewsArticle].
class _ArticleStats extends StatelessWidget {
  const _ArticleStats({
    required this.article,
    required this.locale,
    required this.isCompact,
  });

  static const int _hardcodedViews = 135;
  static const int _wordsPerMinute = 200;

  final NewsArticle article;
  final AppLocale locale;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final feed = context.t.newsFeed;
    final readMinutes = _estimateReadMinutes(article.bodyFor(locale));
    final cells = <Widget>[
      _StatCell(
        icon: Icons.schedule_outlined,
        label: feed.readTimeLabel,
        value: feed.readTimeValue(minutes: readMinutes),
      ),
      _StatCell(
        icon: Icons.visibility_outlined,
        label: feed.viewsLabel,
        value: _hardcodedViews.toString(),
      ),
      if (article.publishedAt != null)
        _StatCell(
          icon: Icons.calendar_today_outlined,
          label: feed.publishedLabel,
          value: MaterialLocalizations.of(context).formatCompactDate(article.publishedAt!),
        ),
    ];

    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < cells.length; i++) ...[
            cells[i],
            if (!_isLastStatCell(i, cells.length)) const SizedBox(height: KSize.margin4x),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < cells.length; i++) ...[
          Expanded(child: cells[i]),
          if (!_isLastStatCell(i, cells.length)) const SizedBox(width: KSize.margin6x),
        ],
      ],
    );
  }

  static bool _isLastStatCell(int index, int length) => index == length - 1;

  static int _estimateReadMinutes(String body) {
    final words = body.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
    if (words == 0) return 1;
    return (words / _wordsPerMinute).ceil().clamp(1, 99);
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: KSize.iconM, color: context.colors.forestGreen),
        const SizedBox(width: KSize.margin3x),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label.toUpperCase(),
                style: context.textContent.archiveMeta,
              ),
              const SizedBox(height: KSize.margin1x),
              Text(
                value,
                style: context.textContent.archiveCardTitle.copyWith(
                  fontWeight: KSize.fontWeightBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
