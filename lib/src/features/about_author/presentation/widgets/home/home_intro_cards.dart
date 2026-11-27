import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/about_author/presentation/widgets/home/home_announcements.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_config_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/presentation/screens/about_author_page_constants.dart';
import 'package:web_art_galery/src/features/about_author/presentation/widgets/author_photo_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/telemetry/analytics_events.dart';

/// "Главная история" first, then the announcements carousel (or "О
/// художнике" when there are no announcements) — stacked on phones / tablets,
/// side by side on desktop.
///
/// The story card shows the newest Firestore news article (cover image,
/// title, excerpt, date); until news is available — or when there is none —
/// it tells the "Tapestry of the Century" story from the biography instead.
class HomeIntroCards extends StatelessWidget {
  const HomeIntroCards({super.key, required this.layout, required this.onReadBiography});

  final PageLayout layout;
  final VoidCallback onReadBiography;

  @override
  Widget build(BuildContext context) {
    // Third-party news announcements (Remote Config `MAIN_NEWS`) take the
    // "About the artist" slot; the artist card returns when there are none.
    final config = context.watch<AppConfigCubit>().state;
    final about = config.announcements.isEmpty
        ? _AboutCard(layout: layout, onMore: onReadBiography)
        : HomeAnnouncementsCard(
            layout: layout,
            announcements: config.announcements,
            source: config.source,
          );
    final story = _StoryCard(layout: layout, onReadBiography: onReadBiography);

    if (!layout.isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          story,
          SizedBox(height: layout.isPhone ? KSize.margin3x : KSize.margin5x),
          about,
        ],
      );
    }
    // Equal-height cards; the photos stretch to the taller text block.
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 11, child: story),
          const SizedBox(width: KSize.margin6x),
          Expanded(flex: 10, child: about),
        ],
      ),
    );
  }
}

// ─── Card shell ──────────────────────────────────────────────────────────────

/// Parchment card with an image slot and a text slot. The image keeps
/// [imageAspectRatio] as its minimum and stretches with the text height.
class _IntroCard extends StatelessWidget {
  const _IntroCard({
    required this.layout,
    required this.image,
    required this.imageAspectRatio,
    required this.content,
    this.imageFirst = true,
    this.imageFlex = 5,
    this.contentFlex = 6,
  });

  final PageLayout layout;
  final Widget image;
  final double imageAspectRatio;
  final Widget content;
  final bool imageFirst;
  final int imageFlex;
  final int contentFlex;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final padding = layout.isPhone ? KSize.margin3x : KSize.margin4x;
    final radius = BorderRadius.circular(KSize.homeCardRadius);

    return Container(
      decoration: BoxDecoration(
        color: colors.parchmentCard,
        borderRadius: radius,
        border: Border.all(color: colors.parchmentLine),
        boxShadow: [
          BoxShadow(
            color: colors.cardShadow,
            blurRadius: KSize.margin6x,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.all(padding),
      child: _buildBody(padding),
    );
  }

  // No LayoutBuilder here: the desktop row measures these cards through
  // IntrinsicHeight, which LayoutBuilder can't answer. The image slots are
  // AspectRatio boxes, which report their intrinsic height from the width
  // alone, so the network images inside are never asked.
  Widget _buildBody(double padding) {
    final imageBox = ClipRRect(
      borderRadius: BorderRadius.circular(KSize.homeCardRadius - KSize.margin1x),
      child: image,
    );

    // Very narrow phones: image on top, text below.
    final cardInnerWidth = layout.width - layout.gutter * 2 - padding * 2;
    if (layout.isPhone && cardInnerWidth < KSize.homeCardStackBreakpoint) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(aspectRatio: KSize.homeStoryImageAspectRatio, child: imageBox),
          const SizedBox(height: KSize.margin4x),
          content,
        ],
      );
    }

    final imageSlot = Expanded(
      flex: imageFlex,
      child: AspectRatio(aspectRatio: imageAspectRatio, child: imageBox),
    );
    final contentSlot = Expanded(
      flex: contentFlex,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: layout.isPhone ? 0 : KSize.margin2x),
        child: content,
      ),
    );
    final gap = SizedBox(width: layout.isPhone ? KSize.margin4x : KSize.margin6x);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: imageFirst ? [imageSlot, gap, contentSlot] : [contentSlot, gap, imageSlot],
      ),
    );
  }
}

// ─── About the artist ────────────────────────────────────────────────────────

class _AboutCard extends StatelessWidget {
  const _AboutCard({required this.layout, required this.onMore});

  final PageLayout layout;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isPhone = layout.isPhone;

    return _IntroCard(
      layout: layout,
      // Desktop mirrors the design: text first, portrait-format image right.
      imageFirst: !layout.isWide,
      imageAspectRatio: layout.isWide
          ? KSize.homeAboutImageAspectRatio
          : KSize.homeCardImageAspectRatioCompact,
      imageFlex: layout.isWide ? 5 : 4,
      image: const AuthorPhotoView(
        index: AboutAuthorPageConstants.universalRealismPhotoIndex,
        alignment: Alignment.topCenter,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GalleryEyebrow(text: t.home.about.label, showRule: !isPhone),
          SizedBox(height: isPhone ? KSize.margin2x : KSize.margin4x),
          Text(
            t.bio.heroBrandName,
            style: context.textContent.homeTitle(isPhone ? KSize.fontSizeXL : KSize.fontSize3XL),
          ),
          SizedBox(height: isPhone ? KSize.margin2x : KSize.margin4x),
          Text(
            t.home.about.body,
            style: isPhone ? context.textContent.homeBodyCompact : context.textContent.homeBody,
            maxLines: isPhone ? 4 : null,
            overflow: isPhone ? TextOverflow.ellipsis : null,
          ),
          SizedBox(height: isPhone ? KSize.margin3x : KSize.margin5x),
          GalleryArrowLink(
            label: t.home.about.cta,
            onTap: () {
              AnalyticsEvents.cta(origin: 'home_about', target: 'biography');
              onMore();
            },
          ),
        ],
      ),
    );
  }
}

// ─── Main story ──────────────────────────────────────────────────────────────

class _StoryCard extends StatelessWidget {
  const _StoryCard({required this.layout, required this.onReadBiography});

  final PageLayout layout;
  final VoidCallback onReadBiography;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppLocaleCubit>().state.locale;

    return BlocBuilder<NewsListCubit, NewsListState>(
      builder: (context, state) {
        final article = state is NewsListLoaded && state.articles.isNotEmpty
            ? state.articles.first
            : null;
        final isLoading = state is NewsListInitial || state is NewsListLoading;

        return _IntroCard(
          layout: layout,
          imageAspectRatio: layout.isPhone
              ? KSize.homeCardImageAspectRatioCompact
              : KSize.homeStoryImageAspectRatio,
          imageFlex: layout.isPhone ? 4 : 6,
          contentFlex: layout.isPhone ? 6 : 5,
          image: _storyImage(context, article, isLoading),
          content: isLoading
              ? const _StorySkeleton()
              : article != null
              ? _StoryText(
                  layout: layout,
                  title: article.titleFor(locale),
                  excerpt: article.excerptFor(locale),
                  date: article.publishedAt,
                  ctaLabel: context.t.home.story.readArticle,
                  onTap: () => _openArticle(context, article),
                )
              : _StoryText(
                  layout: layout,
                  title: context.t.bio.tapestry.title,
                  excerpt: context.t.bio.tapestry.intro,
                  ctaLabel: context.t.home.story.readStory,
                  onTap: () {
                    AnalyticsEvents.cta(origin: 'home_story', target: 'biography');
                    onReadBiography();
                  },
                ),
        );
      },
    );
  }

  Widget _storyImage(BuildContext context, NewsArticle? article, bool isLoading) {
    if (isLoading) {
      return ColoredBox(
        color: context.colors.parchmentLine,
        child: const Center(child: AppLoader()),
      );
    }
    if (article != null && article.hasImage) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _openArticle(context, article),
          child: CachedNetworkImageView(
            imagePathOrUrl: article.imageUrls.first,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      );
    }
    return const AuthorPhotoView(index: AboutAuthorPageConstants.tapestryPhotoIndex);
  }

  void _openArticle(BuildContext context, NewsArticle article) {
    // Same URL scheme as the news list: editorial slug, else the doc id.
    final segment = article.hasName ? article.name : article.id;
    AnalyticsEvents.newsArticleOpened(articleId: article.id, origin: 'home_story');
    context.go('${AppRoutes.news}/$segment');
  }
}

class _StoryText extends StatelessWidget {
  const _StoryText({
    required this.layout,
    required this.title,
    required this.excerpt,
    required this.ctaLabel,
    required this.onTap,
    this.date,
  });

  final PageLayout layout;
  final String title;
  final String excerpt;
  final String ctaLabel;
  final VoidCallback onTap;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final isPhone = layout.isPhone;
    final date = this.date;
    final link = GalleryArrowLink(label: ctaLabel, onTap: onTap);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GalleryEyebrow(text: context.t.home.story.label, showRule: false),
        SizedBox(height: isPhone ? KSize.margin2x : KSize.margin4x),
        Text(
          title,
          style: context.textContent.homeTitle(isPhone ? KSize.fontSizeXL : KSize.fontSize2XL + 4),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        if (excerpt.isNotEmpty) ...[
          SizedBox(height: isPhone ? KSize.margin2x : KSize.margin3x),
          Text(
            excerpt,
            style: isPhone ? context.textContent.homeBodyCompact : context.textContent.homeBody,
            maxLines: isPhone ? 3 : 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        SizedBox(height: isPhone ? KSize.margin3x : KSize.margin5x),
        if (date == null || isPhone)
          link
        else
          Row(
            children: [
              Text(
                MaterialLocalizations.of(context).formatMediumDate(date),
                style: context.textContent.homeMeta,
              ),
              const Spacer(),
              Flexible(flex: 3, child: link),
            ],
          ),
      ],
    );
  }
}

class _StorySkeleton extends StatelessWidget {
  const _StorySkeleton();

  @override
  Widget build(BuildContext context) {
    final bar = context.colors.parchmentLine;

    Widget line(double widthFactor, double height) => FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: height,
        margin: const EdgeInsets.only(bottom: KSize.margin3x),
        decoration: BoxDecoration(
          color: bar,
          borderRadius: BorderRadius.circular(KSize.radiusSmall),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GalleryEyebrow(text: context.t.home.story.label, showRule: false),
        const SizedBox(height: KSize.margin4x),
        line(0.9, KSize.margin6x),
        line(0.6, KSize.margin6x),
        line(1, KSize.margin3x),
        line(0.8, KSize.margin3x),
      ],
    );
  }
}
