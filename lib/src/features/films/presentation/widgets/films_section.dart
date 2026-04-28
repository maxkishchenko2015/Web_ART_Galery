import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

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
      onTap: () => _openFilm(film),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FilmThumbnail(film: film, featured: true),
          const SizedBox(height: KSize.margin5x),
          Text(filmsCopy.latestLabel.toUpperCase(), style: context.textContent.archiveSectionLabel),
          const SizedBox(height: KSize.margin2x),
          Text(_localizedTitle(t, film), style: context.textContent.archiveFeaturedTitle),
          const SizedBox(height: KSize.margin3x),
          Text(_localizedExcerpt(t, film), style: context.textContent.archiveExcerpt),
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
    final title = _localizedTitle(t, film);
    final excerpt = _localizedExcerpt(t, film);

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLarge),
      onTap: () => _openFilm(film),
      child: isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FilmThumbnail(film: film, featured: false),
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
                  child: _FilmThumbnail(film: film, featured: false),
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
    final title = _localizedTitle(t, reel);
    final excerpt = _localizedExcerpt(t, reel);

    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusLarge),
      onTap: () => _openFilm(reel),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FilmThumbnail(film: reel, featured: false, aspectRatio: KSize.reelCardAspectRatio),
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

// ─── Thumbnail (with red play button overlay) ────────────────────────────────

class _FilmThumbnail extends StatelessWidget {
  const _FilmThumbnail({
    required this.film,
    required this.featured,
    this.aspectRatio = KSize.filmCardAspectRatio,
  });

  final Film film;
  final bool featured;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = featured ? KSize.radiusLargeExtra : KSize.radiusLarge;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Brand gradient backdrop — also serves as the fallback when the
            // remote thumbnail fails to load (Drive without public sharing,
            // Instagram, YouTube tile fetch errors, etc.).
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colors.forestGreen, colors.darkOlive],
                ),
              ),
            ),
            if (film.thumbnailUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: film.thumbnailUrl,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 180),
                // We deliberately render *no* widget while loading or on
                // error: the gradient backdrop below keeps the box looking
                // intentional, while tile failures stay silent (see also
                // AppTelemetry._isIgnorableError).
                placeholder: (context, _) => const SizedBox.shrink(),
                errorWidget: (context, _, _) => const SizedBox.shrink(),
              ),
            // Subtle scrim so the chip + play button stay legible on top of
            // any thumbnail content.
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withAlpha(40),
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(70),
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
              ),
            ),
            // Host chip
            Positioned(
              top: featured ? KSize.featuredArtworkChipInset : KSize.regularFilmChipInset,
              right: featured ? KSize.featuredArtworkChipInset : KSize.regularFilmChipInset,
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
                child: Text(film.hostLabel, style: context.textOnDark.footerSitemapLabel),
              ),
            ),
            // Centered red play button — the visual hook from the screenshot.
            Center(child: _PlayButton(featured: featured)),
          ],
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.featured});

  final bool featured;

  @override
  Widget build(BuildContext context) {
    final size = featured ? KSize.playButtonSizeFeatured : KSize.playButtonSizeDefault;
    final iconSize = featured ? KSize.playButtonIconSizeFeatured : KSize.playButtonIconSizeDefault;
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.playButtonRed,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(70),
              blurRadius: KSize.playButtonShadowBlur,
              offset: const Offset(0, KSize.playButtonShadowOffsetY),
            ),
          ],
        ),
        child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: iconSize),
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
            onTap: () => _openFilm(film),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(watchLabel.toUpperCase(), style: context.textContent.archiveLink),
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

// ─── Helpers ──────────────────────────────────────────────────────────────────

Future<void> _openFilm(Film film) async {
  AppTelemetry.instance.logEvent(
    'films_card_opened',
    params: <String, Object?>{'key': film.key, 'video_id': film.videoId, 'source': film.sourceTag},
  );
  await launchUrl(Uri.parse(film.watchUrl), webOnlyWindowName: '_blank');
}

String _localizedTitle(Translations t, Film film) {
  final path = 'films.items.${film.key}.title';
  final value = t[path];
  if (value is String && value != path) {
    return value;
  }
  return film.key;
}

String _localizedExcerpt(Translations t, Film film) {
  final path = 'films.items.${film.key}.excerpt';
  final value = t[path];
  if (value is String && value != path) {
    return value;
  }
  return '';
}
