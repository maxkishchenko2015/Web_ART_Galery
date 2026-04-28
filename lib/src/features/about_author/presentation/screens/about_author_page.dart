import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/about_author_cubit.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/fullscreen_image_viewer.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

/// Indices of the Firestore `AboutAuthor.items` array pinned to each section.
const int _heroPhotoIndex = 0;
const int _universalRealismPhotoIndex = 1;
const int _tapestryPhotoIndex = 2;
const int _chernobylPhotoIndex = 3;
const int _mosaicPhotoIndex = 4;

/// External references shown as "Open article"-style text buttons next to the
/// matching biography sections.
const String _tapestryExternalUrl = 'https://robbielafleur.com/2016/01/16/tapestry-of-the-century/';
const String _chernobylExternalUrl = 'https://www.un.org/ungifts/chernobyl';
const String _mosaicExternalUrl = 'https://streetartcities.com/artists/alexander-kishchenko';
const String _wikipediaUrl =
    'https://ru.wikipedia.org/wiki/%D0%9A%D0%B8%D1%89%D0%B5%D0%BD%D0%BA%D0%BE,_%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80_%D0%9C%D0%B8%D1%85%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%B8%D1%87';

class AboutAuthorPage extends StatelessWidget {
  const AboutAuthorPage({super.key});

  @override
  Widget build(BuildContext context) => const _AboutAuthorView();
}

class _AboutAuthorView extends StatefulWidget {
  const _AboutAuthorView();

  @override
  State<_AboutAuthorView> createState() => _AboutAuthorViewState();
}

class _AboutAuthorViewState extends State<_AboutAuthorView> {
  final _bioKey = GlobalKey();

  void _scrollToBio() {
    final ctx = _bioKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(ctx, duration: KSize.durationScroll, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < KSize.adaptiveExpandedBreakpoint;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _HeroSection(isCompact: isCompact, onLearnMore: _scrollToBio),
          _FeatureSection(isCompact: isCompact),
          _BiographySection(key: _bioKey, isCompact: isCompact),
        ],
      ),
    );
  }
}

// ─── Hero section ─────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.isCompact, required this.onLearnMore});

  final bool isCompact;
  final VoidCallback onLearnMore;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final headlineSize = isCompact ? 36.0 : 56.0;

    return Container(
      color: context.colors.forestGreen,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: isCompact ? 48 : 80),
      child: isCompact
          ? _buildCompactHero(context, headlineSize)
          : _buildWideHero(context, headlineSize),
    );
  }

  Widget _buildWideHero(BuildContext context, double headlineSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _HeroText(headlineSize: headlineSize, onLearnMore: onLearnMore),
        ),
        const SizedBox(width: KSize.margin12x),
        const Expanded(flex: 3, child: _HeroImage()),
      ],
    );
  }

  Widget _buildCompactHero(BuildContext context, double headlineSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroText(headlineSize: headlineSize, onLearnMore: onLearnMore),
        const SizedBox(height: KSize.margin12x),
        const _HeroImage(),
      ],
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.headlineSize, required this.onLearnMore});

  final double headlineSize;
  final VoidCallback onLearnMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.navigation.aboutAuthor.toUpperCase(),
          style: context.textOnDark.heroSectionLabel,
        ),
        const SizedBox(height: KSize.margin4x),
        Text(context.t.app.title, style: context.textOnDark.heroHeadline(headlineSize)),
        const SizedBox(height: KSize.margin3x),
        Text(context.t.bio.heroTitle, style: context.textOnDark.heroSubtitle),
        const SizedBox(height: KSize.margin4x),
        Text(context.t.bio.heroSubtitle, style: context.textOnDark.heroBody),
        const SizedBox(height: KSize.margin9x),
        Wrap(
          spacing: KSize.margin4x,
          runSpacing: KSize.margin4x,
          children: [
            _HeroButton(
              label: context.t.common.viewCatalog,
              filled: true,
              onTap: () => context.go('/catalog'),
            ),
            _HeroButton(label: context.t.common.learnMore, filled: false, onTap: onLearnMore),
          ],
        ),
      ],
    );
  }
}

class _HeroButton extends StatelessWidget {
  const _HeroButton({required this.label, required this.filled, required this.onTap});

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin8x, vertical: KSize.margin4x),
          decoration: BoxDecoration(
            color: filled ? colors.onDark : Colors.transparent,
            border: Border.all(color: colors.onDarkBody),
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          ),
          child: Text(label, style: context.textOnDark.heroButtonLabel(filled)),
        ),
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return _AuthorPhoto(
      index: _heroPhotoIndex,
      aspectRatio: 0.75,
      borderRadius: BorderRadius.circular(KSize.radius3XL),
      placeholderBackground: colors.onDarkPlaceholder,
      placeholderIcon: Icons.palette_outlined,
      placeholderIconColor: colors.onDarkPlaceholderIcon,
      placeholderIconSize: KSize.iconHeroPlaceholder,
    );
  }
}

// ─── Feature section ──────────────────────────────────────────────────────────

class _FeatureSection extends StatelessWidget {
  const _FeatureSection({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;

    return Container(
      color: context.colors.white,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: isCompact ? 48 : 80),
      child: isCompact ? _buildCompact(context) : _buildWide(context),
    );
  }

  Widget _buildWide(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: KSize.margin12x * 2,
      children: [
        Expanded(flex: 3, child: _FeatureStats()),
        Expanded(flex: 4, child: _FeatureDescription()),
      ],
    );
  }

  Widget _buildCompact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FeatureDescription(),
        const SizedBox(height: KSize.margin12x),
        _FeatureStats(),
      ],
    );
  }
}

class _FeatureDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feature = context.t.bio.feature;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(feature.title, style: context.textContent.featureHeadline),
        const SizedBox(height: KSize.margin6x),
        Text(feature.body, style: context.textContent.featureBody),
        const SizedBox(height: KSize.margin9x),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => context.go('/catalog'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(feature.cta, style: context.textContent.featureCta),
                const SizedBox(width: KSize.margin3x),
                Icon(Icons.arrow_forward, size: KSize.iconSPlus, color: context.colors.forestGreen),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feature = context.t.bio.feature;

    return Column(
      children: [
        _StatItem(value: feature.worksValue, label: feature.worksLabel),
        const SizedBox(height: KSize.margin8x),
        const Divider(height: 1),
        const SizedBox(height: KSize.margin8x),
        _StatItem(value: feature.panelsValue, label: feature.panelsLabel),
        const SizedBox(height: KSize.margin8x),
        const Divider(height: 1),
        const SizedBox(height: KSize.margin8x),
        _StatItem(value: feature.guinnessValue, label: feature.guinnessLabel),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(value, style: context.textContent.statValue),
        const SizedBox(width: KSize.margin4x),
        Text(label, style: context.textContent.statLabel),
      ],
    );
  }
}

// ─── Biography section ─────────────────────────────────────────────────────────────────────────────

class _BiographySection extends StatelessWidget {
  const _BiographySection({super.key, required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final bio = context.t.bio;

    return Container(
      color: context.colors.bioBg,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: isCompact ? 48 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bio.name, style: context.textContent.bioName(isCompact ? 24.0 : 34.0)),
          const SizedBox(height: KSize.margin3x),
          Text(bio.tagline, style: context.textContent.bioTagline),
          const SizedBox(height: KSize.margin8x),
          Text(bio.intro, style: context.textContent.bioIntro),
          const SizedBox(height: KSize.margin5x),
          _BioExternalLinkButton(url: _wikipediaUrl, label: bio.wikipediaLinkLabel),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: _universalRealismPhotoIndex,
            child: _BioSubSection(title: bio.universalRealism.title, body: bio.universalRealism.body),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: _tapestryPhotoIndex,
            child: _TapestryCopy(),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: _chernobylPhotoIndex,
            child: _ChernobylCopy(),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: _mosaicPhotoIndex,
            child: _MosaicCopy(),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSubSection(title: bio.legacy.title, body: bio.legacy.body),
          const SizedBox(height: KSize.margin12x),
          _BioQuote(text: bio.quote, author: bio.quoteAuthor),
        ],
      ),
    );
  }
}

// ─── Adaptive "text + photo" layout used by bio sections ──────────────────────
//
// On wide viewports: text on the left, photo on the right.
// On compact viewports: photo on top, text below. Photo and text are kept in
// the reading order so the story still flows naturally on mobile.
//
// Bio-section photos open in a fullscreen overlay on tap, with a Hero
// animation from the thumbnail to the expanded view.

class _BioSectionWithPhoto extends StatelessWidget {
  const _BioSectionWithPhoto({
    required this.isCompact,
    required this.photoIndex,
    required this.child,
  });

  final bool isCompact;
  final int photoIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final media = _AuthorPhoto(
      index: photoIndex,
      aspectRatio: isCompact ? 4 / 3 : 5 / 4,
      borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
      placeholderBackground: context.colors.bioBg,
      placeholderIcon: Icons.image_outlined,
      placeholderIconColor: context.colors.onDarkPlaceholderIcon,
      placeholderIconSize: KSize.iconHeroPlaceholder,
      heroTag: 'about-author-photo-$photoIndex',
      openFullscreenOnTap: true,
    );

    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          media,
          const SizedBox(height: KSize.margin8x),
          child,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: child),
        const SizedBox(width: KSize.margin12x),
        Expanded(flex: 5, child: media),
      ],
    );
  }
}

class _TapestryCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tapestry = context.t.bio.tapestry;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BioSubSection(title: tapestry.title, body: tapestry.intro),
        const SizedBox(height: KSize.margin6x),
        _BioHighlightRow(label: tapestry.scaleLabel, text: tapestry.scale),
        const SizedBox(height: KSize.margin4x),
        _BioHighlightRow(label: tapestry.conceptLabel, text: tapestry.concept),
        const SizedBox(height: KSize.margin4x),
        _BioHighlightRow(label: tapestry.meaningLabel, text: tapestry.meaning),
        const SizedBox(height: KSize.margin5x),
        const _BioExternalLinkButton(url: _tapestryExternalUrl),
      ],
    );
  }
}

class _ChernobylCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chernobyl = context.t.bio.chernobyl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BioSubSection(title: chernobyl.title, body: chernobyl.body),
        const SizedBox(height: KSize.margin5x),
        const _BioExternalLinkButton(url: _chernobylExternalUrl),
      ],
    );
  }
}

class _MosaicCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mosaic = context.t.bio.mosaic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BioSubSection(title: mosaic.title, body: mosaic.intro),
        const SizedBox(height: KSize.margin4x),
        _BioHighlightRow(label: mosaic.panelsLabel, text: mosaic.panels),
        const SizedBox(height: KSize.margin4x),
        Text(mosaic.panelsMeaning, style: context.textContent.bioDetail),
        const SizedBox(height: KSize.margin5x),
        const _BioExternalLinkButton(url: _mosaicExternalUrl),
      ],
    );
  }
}

// ─── Shared author-photo widget ──────────────────────────────────────────────
//
// Consumes [AboutAuthorCubit] and renders the photo pinned at [index]. When
// the cubit is still loading it shows a spinner; when the index is missing or
// the URL is empty it shows a configurable placeholder so each section can
// match its own color palette.

class _AuthorPhoto extends StatelessWidget {
  const _AuthorPhoto({
    required this.index,
    required this.aspectRatio,
    required this.borderRadius,
    required this.placeholderBackground,
    required this.placeholderIcon,
    required this.placeholderIconColor,
    required this.placeholderIconSize,
    this.heroTag,
    this.openFullscreenOnTap = false,
  });

  final int index;
  final double aspectRatio;
  final BorderRadius borderRadius;
  final Color placeholderBackground;
  final IconData placeholderIcon;
  final Color placeholderIconColor;
  final double placeholderIconSize;
  final Object? heroTag;
  final bool openFullscreenOnTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutAuthorCubit, AboutAuthorState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        final photo = switch (state) {
          AboutAuthorLoaded(:final photos) =>
            (index >= 0 && index < photos.length) ? photos[index] : null,
          _ => null,
        };
        final isLoading = state is AboutAuthorInitial || state is AboutAuthorLoading;
        final hasPhoto = photo != null && !photo.isEmpty;

        Widget inner;
        if (hasPhoto) {
          inner = CachedNetworkImageView(
            imagePathOrUrl: photo.url,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
          if (heroTag != null) {
            inner = Hero(tag: heroTag!, child: inner);
          }
        } else if (isLoading) {
          inner = const _AuthorPhotoLoading();
        } else {
          inner = _AuthorPhotoPlaceholder(
            icon: placeholderIcon,
            iconColor: placeholderIconColor,
            iconSize: placeholderIconSize,
          );
        }

        final frame = ClipRRect(
          borderRadius: borderRadius,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: placeholderBackground,
                borderRadius: borderRadius,
              ),
              child: inner,
            ),
          ),
        );

        if (!hasPhoto || !openFullscreenOnTap) {
          return frame;
        }

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Semantics(
            button: true,
            image: true,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FullscreenImageViewer.show(
                context,
                imagePathOrUrl: photo.url,
                heroTag: heroTag,
              ),
              child: frame,
            ),
          ),
        );
      },
    );
  }
}

class _AuthorPhotoLoading extends StatelessWidget {
  const _AuthorPhotoLoading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: KSize.defaultCircularProgressIndicatorSize,
        height: KSize.defaultCircularProgressIndicatorSize,
        child: CircularProgressIndicator(
          strokeWidth: KSize.defaultCircularProgressIndicatorSizeStrokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(context.colors.forestGreen),
        ),
      ),
    );
  }
}

class _AuthorPhotoPlaceholder extends StatelessWidget {
  const _AuthorPhotoPlaceholder({
    required this.icon,
    required this.iconColor,
    required this.iconSize,
  });

  final IconData icon;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }
}

class _BioSubSection extends StatelessWidget {
  const _BioSubSection({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: KSize.margin10x,
          height: KSize.borderWidthSmall,
          color: context.colors.forestGreen,
        ),
        const SizedBox(height: KSize.margin4x),
        Text(title, style: context.textContent.bioSectionTitle),
        const SizedBox(height: KSize.margin4x),
        Text(body, style: context.textContent.bioBody),
      ],
    );
  }
}

class _BioHighlightRow extends StatelessWidget {
  const _BioHighlightRow({required this.label, required this.text});

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: KSize.margin4x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: KSize.bulletXS,
            height: KSize.bulletXS,
            margin: const EdgeInsets.only(top: 7, right: KSize.margin3x),
            decoration: BoxDecoration(color: context.colors.forestGreen, shape: BoxShape.circle),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '$label: ', style: context.textContent.bioHighlightLabel),
                  TextSpan(text: text, style: context.textContent.bioHighlightText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Text CTA for an external reference attached to a biography section.
///
/// Visually mirrors the "Open article" link used in the archive feed
/// ([`_NewsMetaRow`](../../archive/presentation/widgets/news_section.dart)):
/// uppercase label in `archiveLink` style + outward-arrow icon, all in
/// [AppColors.forestGreen]. The URL opens in a new tab/window on web and in
/// the system browser on native platforms.
class _BioExternalLinkButton extends StatelessWidget {
  const _BioExternalLinkButton({required this.url, this.label});

  final String url;

  /// Optional override; defaults to the shared `common.learnMore` string when
  /// null, preserving the original "Learn more" behaviour for legacy call sites.
  final String? label;

  @override
  Widget build(BuildContext context) {
    final label = this.label ?? context.t.common.learnMore;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Semantics(
        button: true,
        link: true,
        label: label,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: url),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: context.textContent.archiveLink),
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
    );
  }
}

class _BioQuote extends StatelessWidget {
  const _BioQuote({required this.text, required this.author});

  final String text;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KSize.margin8x),
      decoration: BoxDecoration(
        color: context.colors.quoteBg,
        border: Border(
          left: BorderSide(color: context.colors.forestGreen, width: KSize.borderWidthMedium),
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: context.textContent.bioQuote),
          const SizedBox(height: KSize.margin4x),
          Text(author, style: context.textContent.bioQuoteAuthor),
        ],
      ),
    );
  }
}
