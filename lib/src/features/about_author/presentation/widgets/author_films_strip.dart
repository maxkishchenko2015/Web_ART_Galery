import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/films/domain/entities/film.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/features/films/presentation/film_actions.dart';
import 'package:web_art_galery/src/features/films/presentation/widgets/film_thumbnail.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Horizontally scrollable strip of every film from the Films page, shown on
/// the About-the-author page between the hero and feature sections.
///
/// It reuses the global [FilmsCubit] (provided at the app root) and the shared
/// [FilmThumbnail] / [openFilm] so the cards stay in lockstep with the Films
/// page and a tap opens the exact same external link. Taps are logged with
/// `origin: 'about_author'` so the films funnel can be sliced by surface.
class AuthorFilmsStrip extends StatelessWidget {
  const AuthorFilmsStrip({super.key, required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsCubit, FilmsState>(
      builder: (context, state) {
        if (state is! FilmsLoaded || state.isEmpty) {
          return const SizedBox.shrink();
        }
        // "All films from the Films page" — the long-form videos followed by
        // the short Instagram reels, in display order.
        final films = <Film>[...state.videos, ...state.reels];
        final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;

        return Container(
          // bioBg is a soft off-white that reads as a distinct band between the
          // forest-green hero above and the white feature section below.
          color: context.colors.bioBg,
          padding: EdgeInsets.symmetric(vertical: isCompact ? KSize.margin10x : KSize.margin13x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: _StripHeader(),
              ),
              const SizedBox(height: KSize.margin8x),
              _FilmsRow(films: films, horizontalPadding: hPad, isCompact: isCompact),
            ],
          ),
        );
      },
    );
  }
}

class _StripHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filmsCopy = context.t.films;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(filmsCopy.title, style: context.textContent.archiveSectionTitle),
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
            Text(filmsCopy.subtitle.toUpperCase(), style: context.textContent.archiveMeta),
            Icon(Icons.movie_outlined, size: KSize.iconSMedium, color: context.colors.forestGreen),
          ],
        ),
      ],
    );
  }
}

/// Owns its own [ScrollController] so the strip can wire up mouse-wheel
/// scrolling and a [ScrollConfiguration] that enables drag-to-scroll with
/// mouse / trackpad on Flutter web — a horizontal list is otherwise
/// unscrollable with a mouse. Mirrors `_ImageStrip` in news_detail_page.dart.
class _FilmsRow extends StatefulWidget {
  const _FilmsRow({required this.films, required this.horizontalPadding, required this.isCompact});

  final List<Film> films;
  final double horizontalPadding;
  final bool isCompact;

  @override
  State<_FilmsRow> createState() => _FilmsRowState();
}

class _FilmsRowState extends State<_FilmsRow> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Translate a vertical (or horizontal) mouse-wheel signal into horizontal
  /// motion so the wheel scrolls the strip on desktop web, where a horizontal
  /// ListView otherwise ignores it.
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
    final cardWidth = widget.isCompact ? 260.0 : 300.0;
    final thumbHeight = cardWidth / KSize.filmCardAspectRatio;
    // A horizontal ListView stretches its children to a tight height, so the
    // row must reserve enough room for the tallest card: thumbnail + gap + a
    // two-line title block. margin16x comfortably fits two lines of
    // archiveCardTitle with headroom for larger text scales.
    final rowHeight = thumbHeight + KSize.margin3x + KSize.margin16x;

    return SizedBox(
      height: rowHeight,
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
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            itemCount: widget.films.length,
            separatorBuilder: (_, _) => const SizedBox(width: KSize.margin6x),
            itemBuilder: (context, index) =>
                _FilmStripCard(film: widget.films[index], width: cardWidth),
          ),
        ),
      ),
    );
  }
}

class _FilmStripCard extends StatelessWidget {
  const _FilmStripCard({required this.film, required this.width});

  final Film film;
  final double width;

  @override
  Widget build(BuildContext context) {
    final title = filmTitle(context.t, film);

    return SizedBox(
      width: width,
      child: InkWell(
        borderRadius: BorderRadius.circular(KSize.radiusLarge),
        onTap: () async => await openFilm(film, origin: 'about_author'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilmThumbnail(film: film, featured: false),
            const SizedBox(height: KSize.margin3x),
            Text(
              title,
              style: context.textContent.archiveCardTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
