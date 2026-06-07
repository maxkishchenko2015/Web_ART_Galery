import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/features/films/presentation/film_actions.dart';
import 'package:web_art_galery/src/features/films/presentation/widgets/film_thumbnail.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class FilmsSection extends StatelessWidget {
  const FilmsSection({super.key});

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
      child: BlocBuilder<FilmsCubit, FilmsState>(
        builder: (context, state) {
          if (state is! FilmsLoaded || state.isEmpty) {
            return const SizedBox.shrink();
          }
          final useTwoColumnLayout = width >= KSize.adaptiveTwoColumnBreakpoint;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FilmsBlock(videos: state.videos, useTwoColumnLayout: useTwoColumnLayout),
              if (state.reels.isNotEmpty) ...[
                const SizedBox(height: KSize.margin15x),
                _ReelsBlock(reels: state.reels, isCompact: isCompact),
              ],
            ],
          );
        },
      ),
    );
  }
}

// ─── Films block (header + featured + responsive list) ───────────────────────

class _FilmsBlock extends StatelessWidget {
  const _FilmsBlock({required this.videos, required this.useTwoColumnLayout});

  final List<Film> videos;
  final bool useTwoColumnLayout;

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) return const SizedBox.shrink();
    final featured = videos.first;
    final secondary = videos.skip(1).toList(growable: false);
    final filmsCopy = context.t.films;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: filmsCopy.title,
          subtitle: filmsCopy.subtitle.toUpperCase(),
          icon: Icons.movie_outlined,
        ),
        const SizedBox(height: KSize.margin10x),
        if (!useTwoColumnLayout)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FilmFeaturedCard(film: featured),
              if (secondary.isNotEmpty) const SizedBox(height: KSize.margin10x),
              for (var i = 0; i < secondary.length; i++) ...[
                if (i != 0) const SizedBox(height: KSize.margin6x),
                _FilmListCard(film: secondary[i]),
              ],
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: _FilmFeaturedCard(film: featured)),
              const SizedBox(width: KSize.margin8x),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < secondary.length; i++) ...[
                      if (i != 0) const SizedBox(height: KSize.margin6x),
                      _FilmListCard(film: secondary[i]),
                    ],
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}

// ─── Reels block (Instagram grid) ────────────────────────────────────────────

class _ReelsBlock extends StatelessWidget {
  const _ReelsBlock({required this.reels, required this.isCompact});

  final List<Film> reels;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final filmsCopy = context.t.films;
    final crossAxisCount = isCompact ? 1 : 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: filmsCopy.instagramTitle,
          subtitle: filmsCopy.instagramSubtitle.toUpperCase(),
          icon: Icons.camera_alt_outlined,
        ),
        const SizedBox(height: KSize.margin10x),
        // Reels are vertical 9:16 — a small grid keeps them tight.
        LayoutBuilder(
          builder: (context, constraints) {
            const gap = KSize.margin5x;
            final cellWidth = (constraints.maxWidth - gap * (crossAxisCount - 1)) / crossAxisCount;
            return Wrap(
              spacing: gap,
              runSpacing: KSize.margin6x,
              children: [
                for (final reel in reels)
                  SizedBox(
                    width: cellWidth.clamp(220.0, 360.0),
                    child: _ReelCard(reel: reel),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

// ─── Section header ──────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textContent.archiveSectionTitle),
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
            Text(subtitle, style: context.textContent.archiveMeta),
            Icon(icon, size: KSize.iconSMedium, color: context.colors.forestGreen),
          ],
        ),
      ],
    );
  }
}

// ─── Featured card (top of the films block) ─────────────────────────────────

class _FilmFeaturedCard extends StatelessWidget {
  const _FilmFeaturedCard({required this.film});

  final Film film;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final filmsCopy = t.films;

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
      onTap: () => openFilm(film),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilmThumbnail(film: film, featured: true),
          const SizedBox(height: KSize.margin5x),
          Text(filmsCopy.latestLabel.toUpperCase(), style: context.textContent.archiveSectionLabel),
          const SizedBox(height: KSize.margin2x),
          Text(filmTitle(t, film), style: context.textContent.archiveFeaturedTitle),
          const SizedBox(height: KSize.margin3x),
          Text(filmExcerpt(t, film), style: context.textContent.archiveExcerpt),
          const SizedBox(height: KSize.margin4x),
          _FilmMetaRow(film: film),
        ],
      ),
    );
  }
}

// ─── List card (everything below the featured card) ──────────────────────────

class _FilmListCard extends StatelessWidget {
  const _FilmListCard({required this.film});

  final Film film;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isCompact = MediaQuery.sizeOf(context).width < KSize.adaptiveExpandedBreakpoint;
    final title = filmTitle(t, film);
    final excerpt = filmExcerpt(t, film);

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLarge),
      onTap: () => openFilm(film),
      child: isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilmThumbnail(film: film, featured: false),
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
                _FilmMetaRow(film: film),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: KSize.newsListArtworkWidth,
                  child: FilmThumbnail(film: film, featured: false),
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
                        _FilmMetaRow(film: film),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// ─── Reel card (Instagram, 9:16) ─────────────────────────────────────────────

class _ReelCard extends StatelessWidget {
  const _ReelCard({required this.reel});

  final Film reel;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final title = filmTitle(t, reel);
    final excerpt = filmExcerpt(t, reel);

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLarge),
      onTap: () => openFilm(reel),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilmThumbnail(film: reel, featured: false, aspectRatio: KSize.reelCardAspectRatio),
          const SizedBox(height: KSize.margin3x),
          if (title.isNotEmpty) Text(title, style: context.textContent.archiveCardTitle),
          if (excerpt.isNotEmpty) ...[
            const SizedBox(height: KSize.margin1x),
            Text(
              excerpt,
              style: context.textContent.archiveExcerpt,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: KSize.margin3x),
          _FilmMetaRow(film: reel),
        ],
      ),
    );
  }
}

// ─── Meta row (source chip + watch link) ─────────────────────────────────────

class _FilmMetaRow extends StatelessWidget {
  const _FilmMetaRow({required this.film});

  final Film film;

  @override
  Widget build(BuildContext context) {
    final filmsCopy = context.t.films;
    final watchLabel = switch (film.source) {
      FilmSource.youtube => filmsCopy.watchOn.youtube,
      FilmSource.googleDrive => filmsCopy.watchOn.googleDrive,
      FilmSource.instagram => filmsCopy.watchOn.instagram,
    };

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: KSize.margin3x,
      runSpacing: KSize.margin2x,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin2x, vertical: KSize.margin1x),
          decoration: BoxDecoration(
            color: context.colors.bioBg,
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          ),
          child: Text(
            '${filmsCopy.sourceLabel}: ${film.hostLabel}',
            style: context.textContent.archiveMeta,
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => openFilm(film),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    watchLabel.toUpperCase(),
                    style: context.textContent.archiveLink,
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
        ),
      ],
    );
  }
}

