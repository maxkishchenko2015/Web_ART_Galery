import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page_constants.dart';
import 'package:web_art_galery/src/features/news/domain/entities/news_article.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/features/news/presentation/widgets/news_list_card.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/page_chrome.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cubit_initializer.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      MetaSEO()
        ..ogTitle(ogTitle: context.t.seo.news.title)
        ..description(description: context.t.seo.news.description)
        ..keywords(keywords: context.t.seo.news.keywords);
    }
    // Load the article list only when the news route is visited (the cubit's
    // own `is Loaded` guard makes revisits a no-op).
    return CubitInitializer(
      onInit: (context) => context.read<NewsListCubit>().load(),
      child: GalleryPageScaffold(
        hero: (layout) => PageHero(
          layout: layout,
          eyebrow: context.t.navigation.news,
          title: context.t.newsFeed.title,
          subtitle: context.t.pages.news.subtitle,
        ),
        sections: (context, layout) => [
          Padding(
            padding: EdgeInsets.fromLTRB(
              layout.gutter,
              layout.sectionGap,
              layout.gutter,
              layout.sectionGap + KSize.margin2x,
            ),
            child: _NewsBody(layout: layout),
          ),
          _StayInTouchBand(layout: layout),
        ],
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListCubit, NewsListState>(
      builder: (context, state) {
        return switch (state) {
          NewsListInitial() || NewsListLoading() => const _LoadingView(),
          // Empty list and fetch errors share the same silent visual: the
          // shell also hides the news tab in these states, so the page is
          // only reachable via direct deep link.
          NewsListLoaded(articles: final articles) when articles.isEmpty => const _EmptyView(),
          NewsListLoaded(articles: final articles) => _ArticleFeed(
            layout: layout,
            articles: articles,
          ),
          NewsListError() => const _EmptyView(),
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
      child: Center(child: AppLoader()),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KSize.margin15x),
      child: Column(
        children: [
          Icon(
            Icons.article_outlined,
            size: KSize.iconHeroPlaceholder,
            color: context.colors.contentMuted.withValues(alpha: 0.5),
          ),
          const SizedBox(height: KSize.margin4x),
          Text(
            context.t.newsFeed.emptyState,
            style: context.textContent.homeBody,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Newest article as the featured card, the rest in an equal-height grid.
class _ArticleFeed extends StatelessWidget {
  const _ArticleFeed({required this.layout, required this.articles});

  final PageLayout layout;
  final List<NewsArticle> articles;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppLocaleCubit>().state.locale;
    final featured = articles.first;
    final rest = articles.skip(1).toList();
    final columns = layout.isWide ? 3 : 2;
    final gap = layout.isPhone ? KSize.margin3x : KSize.margin5x;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NewsFeaturedCard(
          layout: layout,
          article: featured,
          locale: locale,
          onTap: () => _openDetail(context, featured),
        ),
        for (var start = 0; start < rest.length; start += columns) ...[
          SizedBox(height: gap),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = start; i < start + columns; i++) ...[
                  if (i > start) SizedBox(width: gap),
                  Expanded(
                    child: i < rest.length
                        ? NewsGridCard(
                            article: rest[i],
                            locale: locale,
                            // Desktop rows put the cover beside the copy.
                            horizontal: layout.isWide,
                            onTap: () => _openDetail(context, rest[i]),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }

  void _openDetail(BuildContext context, NewsArticle article) {
    // Prefer the editorial slug for the URL so the address bar shows a
    // human-readable `/news/<name>` segment. Legacy items without `name`
    // fall back to the raw Firestore doc id, which the detail page still
    // resolves via its id-fallback branch.
    final segment = article.hasName ? article.name : article.id;
    // Use `go`, not `push`: go_router only reflects the location in the
    // browser address bar for declarative navigation. Because
    // `:articleSlug` is nested under `/news`, `go` still builds the
    // [NewsPage, NewsDetailPage] stack, so back navigation returns here.
    context.go('${AppRoutes.news}/$segment');
  }
}

/// "Будьте в курсе": follow the studio's socials, or open the archive.
class _StayInTouchBand extends StatelessWidget {
  const _StayInTouchBand({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return GalleryBand(
      layout: layout,
      title: t.pages.news.stayTitle,
      body: t.pages.news.stayBody,
      cardFlex: 8,
      card: GalleryBandRoutes(
        layout: layout,
        routes: [
          GalleryBandRoute(
            icon: Icons.photo_camera_outlined,
            title: t.contacts.instagramSectionLabel,
            subtitle: t.contacts.instagramHandle,
            onTap: () =>
                UrlLauncherUtils.launchUrlIfPossible(url: ContactsPageConstants.instagramUrl),
          ),
          GalleryBandRoute(
            icon: Icons.inventory_2_outlined,
            title: t.archiveFeed.title,
            subtitle: t.pages.news.archiveSubtitle,
            onTap: () => context.go(AppRoutes.archive),
          ),
        ],
      ),
    );
  }
}
