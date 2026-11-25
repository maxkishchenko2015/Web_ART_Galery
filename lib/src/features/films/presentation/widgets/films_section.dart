import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page_constants.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/features/films/presentation/film_actions.dart';
import 'package:web_art_galery/src/features/films/presentation/widgets/film_thumbnail.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/page_chrome.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

/// Films page body: the main film, the next films beside it (desktop), the
/// rest — long-form videos then Instagram reels — as rows below.
class FilmsSection extends StatelessWidget {
  const FilmsSection({super.key, required this.layout});

  final PageLayout layout;

  /// Films shown beside the main one on desktop.
  static const int _sideCount = 3;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsCubit, FilmsState>(
      builder: (context, state) {
        if (state is FilmsInitial || state is FilmsLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: KSize.margin15x),
            child: Center(child: AppLoader()),
          );
        }
        if (state is! FilmsLoaded || state.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: KSize.margin15x),
            child: Icon(
              Icons.movie_outlined,
              size: KSize.iconHeroPlaceholder,
              color: context.colors.contentMuted.withValues(alpha: 0.5),
            ),
          );
        }

        final all = <Film>[...state.videos, ...state.reels];
        final featured = all.first;
        final gap = layout.isPhone ? KSize.margin3x : KSize.margin5x;

        if (!layout.isWide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FeaturedFilmCard(layout: layout, film: featured),
              for (final film in all.skip(1)) ...[
                SizedBox(height: gap),
                _FilmRowCard(layout: layout, film: film),
              ],
            ],
          );
        }

        final side = all.skip(1).take(_sideCount).toList();
        final rest = all.skip(1 + _sideCount).toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 11,
                  child: _FeaturedFilmCard(layout: layout, film: featured),
                ),
                SizedBox(width: gap),
                Expanded(
                  flex: 13,
                  child: Column(
                    children: [
                      for (final (i, film) in side.indexed) ...[
                        if (i > 0) SizedBox(height: gap),
                        _FilmRowCard(layout: layout, film: film),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            for (var start = 0; start < rest.length; start += 2) ...[
              SizedBox(height: gap),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _FilmRowCard(layout: layout, film: rest[start]),
                    ),
                    SizedBox(width: gap),
                    Expanded(
                      child: start + 1 < rest.length
                          ? _FilmRowCard(layout: layout, film: rest[start + 1])
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

String _watchLabel(Translations t, Film film) => switch (film.source) {
  FilmSource.youtube => t.films.watchOn.youtube,
  FilmSource.googleDrive => t.films.watchOn.googleDrive,
  FilmSource.instagram => t.films.watchOn.instagram,
};

class _FeaturedFilmCard extends StatelessWidget {
  const _FeaturedFilmCard({required this.layout, required this.film});

  final PageLayout layout;
  final Film film;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isPhone = layout.isPhone;
    final excerpt = filmExcerpt(t, film);

    return GalleryCard(
      onTap: () => openFilm(film),
      padding: EdgeInsets.all(isPhone ? KSize.margin3x : KSize.margin4x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilmThumbnail(
            film: film,
            featured: true,
            showHostChip: false,
            borderRadius: KSize.radiusDefaultMedium,
          ),
          SizedBox(height: isPhone ? KSize.margin4x : KSize.margin5x),
          GalleryEyebrow(text: t.films.latestLabel, showRule: false),
          const SizedBox(height: KSize.margin2x),
          Text(
            filmTitle(t, film),
            style: context.textContent.homeTitle(
              isPhone ? KSize.fontSize2XL : KSize.fontSize3XLHalf,
            ),
          ),
          if (excerpt.isNotEmpty) ...[
            const SizedBox(height: KSize.margin3x),
            Text(
              excerpt,
              style: isPhone ? context.textContent.homeBodyCompact : context.textContent.homeBody,
            ),
          ],
          SizedBox(height: isPhone ? KSize.margin4x : KSize.margin5x),
          _SourceAndLink(film: film, compact: false),
        ],
      ),
    );
  }
}

class _FilmRowCard extends StatelessWidget {
  const _FilmRowCard({required this.layout, required this.film});

  final PageLayout layout;
  final Film film;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isPhone = layout.isPhone;
    final excerpt = filmExcerpt(t, film);

    return GalleryCard(
      onTap: () => openFilm(film),
      padding: EdgeInsets.all(isPhone ? KSize.margin2Halfx : KSize.margin3x),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: FilmThumbnail(
                  film: film,
                  featured: false,
                  showHostChip: false,
                  borderRadius: KSize.radiusDefaultSmall,
                ),
              ),
            ),
            SizedBox(width: isPhone ? KSize.margin3x : KSize.margin5x),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    filmTitle(t, film),
                    style: context.textContent.homeTitle(
                      isPhone ? KSize.fontSizeS + 1 : KSize.fontSizeL,
                    ),
                    maxLines: 3,
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
                  const SizedBox(height: KSize.margin3x),
                  _SourceAndLink(film: film, compact: isPhone),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Источник: YOUTUBE" chip + watch link.
class _SourceAndLink extends StatelessWidget {
  const _SourceAndLink({required this.film, required this.compact});

  final Film film;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: compact ? KSize.margin3x : KSize.margin6x,
      runSpacing: KSize.margin2x,
      children: [
        GalleryTagChip(label: t.pages.films.source(host: film.hostLabel)),
        GalleryArrowLink(
          label: compact ? t.pages.films.watch : _watchLabel(t, film),
          onTap: () => openFilm(film),
        ),
      ],
    );
  }
}

/// "Видеоархив об А. Кищенко": Instagram clips, the publications archive
/// and the news feed.
class FilmsArchiveBand extends StatelessWidget {
  const FilmsArchiveBand({super.key, required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return GalleryBand(
      layout: layout,
      title: t.films.subtitle,
      body: t.pages.films.bandBody,
      card: GalleryBandRoutes(
        layout: layout,
        routes: [
          GalleryBandRoute(
            icon: Icons.smart_display_outlined,
            title: t.films.instagramTitle,
            subtitle: t.films.instagramSubtitle,
            onTap: () =>
                UrlLauncherUtils.launchUrlIfPossible(url: ContactsPageConstants.instagramUrl),
          ),
          GalleryBandRoute(
            icon: Icons.inventory_2_outlined,
            title: t.archiveFeed.title,
            subtitle: t.archiveFeed.moreLabel,
            onTap: () => context.go(AppRoutes.archive),
          ),
          GalleryBandRoute(
            icon: Icons.article_outlined,
            title: t.navigation.news,
            subtitle: t.home.links.news,
            onTap: () => context.go(AppRoutes.news),
          ),
        ],
      ),
    );
  }
}
