import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/about_author_cubit.dart';
import 'package:web_art_galery/src/features/about_author/presentation/screens/about_author_page_constants.dart';
import 'package:web_art_galery/src/features/about_author/presentation/widgets/author_photo_view.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/gallery_footer.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';

/// Scrollable top-level page: [hero], the page [sections] and the site
/// footer, all laid out against one [PageLayout].
class GalleryPageScaffold extends StatelessWidget {
  const GalleryPageScaffold({super.key, required this.hero, required this.sections});

  final Widget Function(PageLayout layout) hero;
  final List<Widget> Function(BuildContext context, PageLayout layout) sections;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = PageLayout(constraints.maxWidth);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              hero(layout),
              ...sections(context, layout),
              GalleryFooter(gutter: layout.gutter, isPhone: layout.isPhone),
            ],
          ),
        );
      },
    );
  }
}

/// Dark banner on top of every inner page: eyebrow, serif title, italic
/// subtitle and, on the right, the same art on every page — the author
/// portrait from the home page (Firestore photo #0, sepia) over a terracotta
/// disc with the faded "Tapestry of the Century" medallion.
///
/// Runs up under the mobile shell's frosted bar (adds `paddingOf.top`).
class PageHero extends StatefulWidget {
  const PageHero({
    super.key,
    required this.layout,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final PageLayout layout;
  final String eyebrow;
  final String title;
  final String subtitle;

  @override
  State<PageHero> createState() => _PageHeroState();
}

class _PageHeroState extends State<PageHero> {
  @override
  void initState() {
    super.initState();
    // The banner art comes from the about-author photos; the cubit ignores
    // repeat calls once loaded.
    unawaited(context.read<AboutAuthorCubit>().loadPhotos());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = widget.layout;
    final isPhone = layout.isPhone;
    final topInset = MediaQuery.paddingOf(context).top;
    final titleSize = isPhone
        ? (layout.width * KSize.pageHeroTitlePhoneFactor).clamp(
            KSize.homeHeroHeadlineMin,
            KSize.fontSize4XL - 2,
          )
        : (layout.contentWidth * KSize.pageHeroTitleWideFactor).clamp(
            KSize.fontSize4XL - 2,
            KSize.pageHeroTitleMax,
          );
    final textWidth = isPhone
        ? layout.width * KSize.pageHeroTextWidthFactorPhone
        : layout.contentWidth * KSize.pageHeroTextWidthFactorWide;
    final artWidth =
        layout.width * (isPhone ? KSize.pageHeroArtFactorPhone : KSize.pageHeroArtFactorWide);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.shell, colors.shellRaised],
        ),
        border: Border(bottom: BorderSide(color: colors.onDarkOverlay)),
      ),
      // ClipRect, not the Stack's own clip: the art's shapes overflow inside
      // a nested Stack, which the outer Stack doesn't see as overflow, so
      // they would otherwise paint over the content below the banner.
      child: ClipRect(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: topInset,
              bottom: 0,
              width: artWidth,
              child: const _HeroArt(),
            ),
            // Keeps the copy readable where the art reaches under it.
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colors.shell,
                        colors.shell.withValues(alpha: 0.85),
                        colors.shell.withValues(alpha: 0),
                      ],
                      stops: isPhone ? const [0, 0.45, 0.7] : const [0, 0.42, 0.62],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                layout.gutter,
                topInset + (isPhone ? KSize.margin6x : KSize.margin8x),
                layout.gutter,
                isPhone ? KSize.margin7x : KSize.margin10x,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                heightFactor: 1,
                child: SizedBox(
                  width: textWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GalleryEyebrow(text: widget.eyebrow, onDark: true),
                      SizedBox(height: isPhone ? KSize.margin2x : KSize.margin3x),
                      Text(widget.title, style: context.textOnDark.heroHeadline(titleSize)),
                      SizedBox(height: isPhone ? KSize.margin2x : KSize.margin3x),
                      Text(
                        widget.subtitle,
                        style: context.textOnDark.heroLead(
                          isPhone ? KSize.fontSizeXSHalf : KSize.fontSizeM,
                        ),
                      ),
                    ],
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

/// Banner art: tapestry medallion + terracotta disc + sepia author portrait.
class _HeroArt extends StatelessWidget {
  const _HeroArt();

  /// Sepia tone — turns any photo into a warm, engraving-like print that
  /// matches the parchment palette.
  static const ColorFilter _sepia = ColorFilter.matrix(<double>[
    0.393, 0.769, 0.189, 0, 0, //
    0.349, 0.686, 0.168, 0, 0, //
    0.272, 0.534, 0.131, 0, 0, //
    0, 0, 0, 1, 0,
  ]);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          final medallion = h * 1.5;
          final disc = h * 1.9;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -medallion * 0.1,
                top: (h - medallion) / 2,
                width: medallion,
                height: medallion,
                child: Opacity(
                  opacity: 0.3,
                  child: ClipOval(
                    child: ColorFiltered(
                      colorFilter: _sepia,
                      child: const AuthorPhotoView(
                        index: AboutAuthorPageConstants.tapestryPhotoIndex,
                        placeholderBackground: Colors.transparent,
                        placeholderIconColor: Colors.transparent,
                        loaderColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -disc * 0.42,
                top: h * 0.3,
                width: disc,
                height: disc,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.terracotta.withValues(alpha: 0.9),
                  ),
                ),
              ),
              Positioned(
                right: w * 0.06,
                top: 0,
                bottom: 0,
                width: w * 0.58,
                child: ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.transparent, Colors.black, Colors.black, Colors.transparent],
                    stops: [0, 0.3, 0.85, 1],
                  ).createShader(bounds),
                  child: ColorFiltered(
                    colorFilter: _sepia,
                    child: AuthorPhotoView(
                      index: AboutAuthorPageConstants.heroPhotoIndex,
                      alignment: Alignment.topCenter,
                      placeholderBackground: Colors.transparent,
                      placeholderIconColor: Colors.transparent,
                      loaderColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Terracotta band with a title + body on the left and a parchment card on
/// the right (stacked on phones / tablets).
class GalleryBand extends StatelessWidget {
  const GalleryBand({
    super.key,
    required this.layout,
    required this.title,
    required this.body,
    required this.card,
    this.cardFlex = 9,
  });

  final PageLayout layout;
  final String title;
  final String body;
  final Widget card;
  final int cardFlex;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: context.textOnDark.bandTitle(layout.sectionTitleSize)),
        const SizedBox(height: KSize.margin3x),
        Text(body, style: context.textOnDark.bandBody),
      ],
    );
    final cardBox = Container(
      decoration: BoxDecoration(
        color: colors.parchmentCard,
        borderRadius: BorderRadius.circular(KSize.homeCardRadius),
        boxShadow: [
          BoxShadow(
            color: colors.cardShadow,
            blurRadius: KSize.margin6x,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: layout.isPhone ? KSize.margin4x : KSize.margin6x,
        vertical: layout.isPhone ? KSize.margin1x : KSize.margin4x,
      ),
      child: card,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [colors.terracottaDeep, colors.terracotta]),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: layout.gutter,
        vertical: layout.isPhone ? KSize.margin8x : KSize.margin10x,
      ),
      child: layout.isWide
          ? Row(
              children: [
                Expanded(flex: 4, child: intro),
                const SizedBox(width: KSize.margin10x),
                Expanded(flex: cardFlex, child: cardBox),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                intro,
                const SizedBox(height: KSize.margin6x),
                cardBox,
              ],
            ),
    );
  }
}

/// Route row inside a [GalleryBand] card: icon, title, subtitle, arrow.
class GalleryBandRoute extends StatelessWidget {
  const GalleryBandRoute({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSize.margin3x),
          child: Row(
            children: [
              Icon(icon, size: KSize.homeStartIcon, color: colors.terracotta),
              const SizedBox(width: KSize.margin4x),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: context.textContent.startRouteTitle),
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: KSize.margin1x),
                      Text(subtitle, style: context.textContent.quickLinkSubtitle),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: KSize.margin3x),
              Icon(Icons.arrow_forward_rounded, size: KSize.iconMS, color: colors.terracotta),
            ],
          ),
        ),
      ),
    );
  }
}

/// Lays [GalleryBandRoute]s out side by side with vertical hairlines on
/// desktop, stacked with horizontal hairlines otherwise.
class GalleryBandRoutes extends StatelessWidget {
  const GalleryBandRoutes({super.key, required this.layout, required this.routes});

  final PageLayout layout;
  final List<Widget> routes;

  @override
  Widget build(BuildContext context) {
    final line = context.colors.parchmentLine;

    if (layout.isWide) {
      return IntrinsicHeight(
        child: Row(
          children: [
            for (final (i, route) in routes.indexed) ...[
              if (i > 0)
                VerticalDivider(
                  width: KSize.margin10x,
                  thickness: KSize.borderWidthVerySmall,
                  color: line,
                ),
              Expanded(child: route),
            ],
          ],
        ),
      );
    }
    return Column(
      children: [
        for (final (i, route) in routes.indexed) ...[
          if (i > 0) Divider(color: line, height: KSize.borderWidthVerySmall),
          route,
        ],
      ],
    );
  }
}
