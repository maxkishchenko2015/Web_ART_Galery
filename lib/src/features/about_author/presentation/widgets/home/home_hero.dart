import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/presentation/screens/about_author_page_constants.dart';
import 'package:web_art_galery/src/features/about_author/presentation/widgets/author_photo_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/features/films/presentation/film_actions.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Dark hero of the home page: eyebrow, serif headline, italic lead, CTAs and
/// the author portrait (Firestore photo #0), with the "Tapestry of the
/// Century" photo faded in as a round texture.
///
/// Desktop: text left, translucent framed portrait right. Phone / tablet: the
/// portrait fills the right part of the hero over a terracotta disc and the
/// text sits over a dark gradient.
class HomeHero extends StatelessWidget {
  const HomeHero({super.key, required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.shell, colors.shellRaised],
        ),
      ),
      child: layout.isWide ? _WideHero(layout: layout) : _CompactHero(layout: layout),
    );
  }
}

// ─── Desktop ──────────────────────────────────────────────────────────────────

class _WideHero extends StatelessWidget {
  const _WideHero({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final gutter = layout.gutter;
    final innerWidth = layout.width - gutter * 2;
    final minHeight = (MediaQuery.sizeOf(context).height * 0.62).clamp(
      KSize.homeHeroMinHeightWide,
      KSize.homeHeroMaxHeightWide,
    );
    final headlineSize = (layout.width * KSize.homeHeroHeadlineWideFactor).clamp(
      KSize.homeHeroHeadlineMin,
      KSize.homeHeroHeadlineMax,
    );
    // Text and portrait get separate slots so they never overlap.
    final textWidth = innerWidth * 0.56;
    final portraitSlotWidth = innerWidth * 0.38;
    final textureSize = minHeight * 1.05;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        // Faded tapestry medallion between the text and the portrait.
        Positioned(
          right: gutter + portraitSlotWidth * 0.55,
          top: -minHeight * 0.14,
          width: textureSize,
          height: textureSize,
          child: const _TextureMedallion(),
        ),
        Positioned(
          right: gutter,
          top: KSize.margin10x,
          bottom: 0,
          width: portraitSlotWidth,
          child: const Align(alignment: Alignment.bottomCenter, child: _FramedPortrait()),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: minHeight),
          child: Padding(
            padding: EdgeInsets.fromLTRB(gutter, KSize.margin16x, gutter, KSize.margin16x),
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1,
              child: SizedBox(
                width: textWidth,
                child: _HeroCopy(headlineSize: headlineSize, leadSize: KSize.fontSizeM + 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Phone / tablet ──────────────────────────────────────────────────────────

class _CompactHero extends StatelessWidget {
  const _CompactHero({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = layout.width;
    final gutter = layout.gutter;
    // The hero runs up under the mobile shell's frosted bar
    // (paddingOf.top = bar height there, 0 on desktop).
    final topInset = MediaQuery.paddingOf(context).top;
    final headlineSize = (width * KSize.homeHeroHeadlineCompactFactor).clamp(
      KSize.homeHeroHeadlineMin,
      KSize.fontSize4XL + 2,
    );
    final textWidth = width * KSize.homeHeroTextWidthFactorCompact;
    final portraitWidth = width * KSize.homeHeroPortraitWidthFactorCompact;
    final discSize = math.min(width * 0.74, KSize.homeHeroMinHeightCompact * 0.8);

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          right: -discSize * 0.2,
          bottom: -discSize * 0.28,
          width: discSize,
          height: discSize,
          child: _Disc(color: colors.terracotta),
        ),
        Positioned(
          right: 0,
          top: topInset + KSize.margin6x,
          bottom: 0,
          width: portraitWidth,
          child: const AuthorPhotoView(
            index: AboutAuthorPageConstants.heroPhotoIndex,
            alignment: Alignment.topCenter,
            placeholderBackground: Colors.transparent,
            placeholderIcon: Icons.palette_outlined,
          ),
        ),
        // Darkens the left part of the portrait so the copy stays readable,
        // and blends the photo edge into the hero background.
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    colors.shell,
                    colors.shell.withValues(alpha: 0.86),
                    colors.shell.withValues(alpha: 0),
                  ],
                  stops: const [0, 0.44, 0.74],
                ),
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: KSize.homeHeroMinHeightCompact,
            minWidth: double.infinity,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(gutter, topInset + KSize.margin8x, gutter, KSize.margin8x),
            child: Align(
              alignment: Alignment.topLeft,
              heightFactor: 1,
              child: SizedBox(
                width: textWidth,
                child: _HeroCopy(
                  headlineSize: headlineSize,
                  leadSize: layout.isPhone ? KSize.fontSizeS : KSize.fontSizeM,
                  stackButtons: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Shared pieces ───────────────────────────────────────────────────────────

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.headlineSize, required this.leadSize, this.stackButtons = false});

  final double headlineSize;
  final double leadSize;
  final bool stackButtons;

  @override
  Widget build(BuildContext context) {
    final hero = context.t.home.hero;
    final worksButton = GalleryPillButton(
      label: hero.worksCta,
      trailingIcon: Icons.arrow_forward_rounded,
      expand: stackButtons,
      onTap: () => context.go(AppRoutes.catalog),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // No rule on phones: the narrow text column would wrap the label.
        GalleryEyebrow(text: hero.eyebrow, onDark: true, showRule: !stackButtons),
        SizedBox(height: stackButtons ? KSize.margin4x : KSize.margin6x),
        Text(hero.title, style: context.textOnDark.heroHeadline(headlineSize)),
        SizedBox(height: stackButtons ? KSize.margin4x : KSize.margin6x),
        Text(hero.lead, style: context.textOnDark.heroLead(leadSize)),
        SizedBox(height: stackButtons ? KSize.margin7x : KSize.margin9x),
        BlocBuilder<FilmsCubit, FilmsState>(
          builder: (context, state) {
            final film = state is FilmsLoaded && state.videos.isNotEmpty
                ? state.videos.first
                : null;
            final filmButton = film == null
                ? null
                : GalleryPillButton(
                    label: hero.filmCta,
                    filled: false,
                    leadingIcon: Icons.play_arrow_rounded,
                    expand: stackButtons,
                    onTap: () => openFilm(film, origin: 'home_hero'),
                  );

            if (stackButtons) {
              return ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: KSize.contentMaxWidth / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    worksButton,
                    if (filmButton != null) ...[const SizedBox(height: KSize.margin3x), filmButton],
                  ],
                ),
              );
            }
            return Wrap(
              spacing: KSize.margin5x,
              runSpacing: KSize.margin4x,
              children: [worksButton, ?filmButton],
            );
          },
        ),
      ],
    );
  }
}

/// Author portrait in a softly rounded rectangle, slightly translucent so it
/// sinks into the hero background; its base fades out at the bottom.
class _FramedPortrait extends StatelessWidget {
  const _FramedPortrait();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(KSize.homeCardRadius);

    return AspectRatio(
      aspectRatio: KSize.homeHeroPortraitAspectRatio,
      child: Opacity(
        opacity: KSize.homeHeroPortraitOpacity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AuthorPhotoView(
              index: AboutAuthorPageConstants.heroPhotoIndex,
              borderRadius: radius,
              alignment: Alignment.topCenter,
              placeholderBackground: colors.onDarkPlaceholder,
              placeholderIcon: Icons.palette_outlined,
            ),
            IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: radius,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colors.shell.withValues(alpha: 0),
                      colors.shell.withValues(alpha: 0),
                      colors.shell.withValues(alpha: 0.6),
                    ],
                    stops: const [0, 0.65, 1],
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

/// Round, heavily faded crop of the "Tapestry of the Century" photo.
class _TextureMedallion extends StatelessWidget {
  const _TextureMedallion();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: KSize.homeHeroTextureOpacity,
        child: ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (bounds) => const RadialGradient(
            colors: [Colors.black, Colors.black, Colors.transparent],
            stops: [0, 0.6, 1],
          ).createShader(bounds),
          child: const ClipOval(
            child: AuthorPhotoView(
              index: AboutAuthorPageConstants.tapestryPhotoIndex,
              placeholderBackground: Colors.transparent,
              placeholderIconColor: Colors.transparent,
              loaderColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}

class _Disc extends StatelessWidget {
  const _Disc({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: const Alignment(-0.3, -0.4),
            colors: [color.withValues(alpha: 0.95), color.withValues(alpha: 0.75)],
          ),
        ),
      ),
    );
  }
}
