import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/about_author_cubit.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/onboarding_tour_cubit.dart';
import 'package:web_art_galery/src/features/about_author/presentation/screens/about_author_page_constants.dart';
import 'package:web_art_galery/src/features/about_author/presentation/widgets/author_films_strip.dart';
import 'package:web_art_galery/src/features/about_author/presentation/widgets/onboarding_tour_overlay.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/app_loader.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cached_network_image_view.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/fullscreen_image_viewer.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

class AboutAuthorPage extends StatelessWidget {
  const AboutAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      MetaSEO()
        ..ogTitle(ogTitle: context.t.seo.aboutAuthor.title)
        ..description(description: context.t.seo.aboutAuthor.description)
        ..keywords(keywords: context.t.seo.aboutAuthor.keywords);
    }
    return const _AboutAuthorView();
  }
}

class _AboutAuthorView extends StatefulWidget {
  const _AboutAuthorView();

  @override
  State<_AboutAuthorView> createState() => _AboutAuthorViewState();
}

class _AboutAuthorViewState extends State<_AboutAuthorView> with OnboardingTourHostMixin {
  final _bioKey = GlobalKey();
  final _authorPhotoKey = GlobalKey();
  final _tapestryMediaKey = GlobalKey();
  final _chernobylMediaKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Trigger this route's data loads on mount instead of at app start, so the
    // first frame is never blocked behind these queries. Cubit-side `is Loaded`
    // guards make repeat visits no-ops. FilmsCubit feeds the author films strip
    // rendered further down this page.
    unawaited(context.read<AboutAuthorCubit>().loadPhotos());
    unawaited(context.read<FilmsCubit>().load());
    attachOnboardingTour();
    scheduleOnboardingTourStart();
  }

  @override
  void dispose() {
    detachOnboardingTour();
    super.dispose();
  }

  @override
  GlobalKey onboardingTourTargetKey(int step) => switch (step) {
    OnboardingTourSteps.tapestryScale => _tapestryMediaKey,
    OnboardingTourSteps.chernobyl => _chernobylMediaKey,
    _ => _authorPhotoKey,
  };

  // Tooltip copy reuses biography strings where it can, so the tour stays in
  // sync with the section texts across all locales.
  @override
  OnboardingTourTooltipData onboardingTourTooltipData(BuildContext context, int step) {
    final t = context.t;
    final stepLabel = '${step + 1}/${OnboardingTourSteps.count}';

    return switch (step) {
      OnboardingTourSteps.tapestryScale => OnboardingTourTooltipData(
        stepLabel: stepLabel,
        title: t.tour.scaleTitle,
        body: t.tour.scaleBody,
        buttonLabel: t.tour.next,
        backLabel: t.tour.back,
        linkLabel: t.common.learnMore,
        linkUrl: AboutAuthorPageConstants.tapestryExternalUrl,
      ),
      OnboardingTourSteps.chernobyl => OnboardingTourTooltipData(
        stepLabel: stepLabel,
        title: t.bio.chernobyl.title,
        body: t.tour.chernobylBody,
        buttonLabel: t.tour.gotIt,
        backLabel: t.tour.back,
      ),
      // First step (author origins) — no back button.
      _ => OnboardingTourTooltipData(
        stepLabel: stepLabel,
        title: t.tour.originsTitle,
        body: t.tour.originsBody,
        buttonLabel: t.tour.next,
      ),
    };
  }

  /// Finishing the final step sends the visitor on to the Films page.
  @override
  void onOnboardingTourCompleted() {
    if (!mounted) return;
    context.go(AppRoutes.films);
  }

  /// Holds the tour back until the section photos are loaded and decoded, so
  /// the scrim never highlights a spinner mid-download.
  @override
  Future<void> prepareOnboardingTour() async {
    final cubit = context.read<AboutAuthorCubit>();
    var state = cubit.state;
    if (state is AboutAuthorInitial || state is AboutAuthorLoading) {
      try {
        state = await cubit.stream
            .firstWhere((s) => s is! AboutAuthorInitial && s is! AboutAuthorLoading)
            .timeout(AboutAuthorPageConstants.tourPhotosWaitTimeout);
      } on TimeoutException {
        return; // Start anyway — the placeholder frame keeps its layout.
      }
    }
    if (state is! AboutAuthorLoaded || !mounted) {
      return;
    }

    final highlightedPhotos = [
      state.photoAt(AboutAuthorPageConstants.heroPhotoIndex),
      state.photoAt(AboutAuthorPageConstants.tapestryPhotoIndex),
      state.photoAt(AboutAuthorPageConstants.chernobylPhotoIndex),
    ];
    await Future.wait(
      highlightedPhotos.map((photo) async {
        if (photo == null || photo.isEmpty || !mounted) {
          return;
        }
        try {
          await precacheImage(
            CachedNetworkImageView.providerFor(photo.url),
            context,
          ).timeout(AboutAuthorPageConstants.tourPhotosWaitTimeout);
        } catch (_) {
          // Image fetch failures must not block the tour.
        }
      }),
    );
  }

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
          _HeroSection(isCompact: isCompact, onLearnMore: _scrollToBio, photoKey: _authorPhotoKey),
          AuthorFilmsStrip(isCompact: isCompact),
          _FeatureSection(isCompact: isCompact),
          _BiographySection(
            key: _bioKey,
            isCompact: isCompact,
            tapestryMediaKey: _tapestryMediaKey,
            chernobylMediaKey: _chernobylMediaKey,
          ),
        ],
      ),
    );
  }
}

// ─── Hero section ─────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.isCompact, required this.onLearnMore, required this.photoKey});

  final bool isCompact;
  final VoidCallback onLearnMore;

  /// Onboarding-tour anchor on the author portrait.
  final GlobalKey photoKey;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final headlineSize = isCompact ? KSize.heroHeadlineCompact : KSize.heroHeadlineWide;

    return Container(
      color: context.colors.forestGreen,
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isCompact ? KSize.heroVerticalPaddingCompact : KSize.heroVerticalPaddingWide,
      ),
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
        Expanded(flex: 3, child: _HeroImage(photoKey: photoKey)),
      ],
    );
  }

  Widget _buildCompactHero(BuildContext context, double headlineSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroText(headlineSize: headlineSize, onLearnMore: onLearnMore),
        const SizedBox(height: KSize.margin12x),
        _HeroImage(photoKey: photoKey),
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
        Text(context.t.bio.heroBrandName, style: context.textOnDark.heroHeadline(headlineSize)),
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
              onTap: () => context.go(AppRoutes.catalog),
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
  const _HeroImage({required this.photoKey});

  /// Onboarding-tour anchor on the author portrait.
  final GlobalKey photoKey;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // RepaintBoundary so the onboarding overlay can snapshot the portrait.
    return RepaintBoundary(
      key: photoKey,
      child: _AuthorPhoto(
        index: AboutAuthorPageConstants.heroPhotoIndex,
        aspectRatio: KSize.heroPortraitAspectRatio,
        borderRadius: BorderRadius.circular(KSize.radius3XL),
        placeholderBackground: colors.onDarkPlaceholder,
        placeholderIcon: Icons.palette_outlined,
        placeholderIconColor: colors.onDarkPlaceholderIcon,
        placeholderIconSize: KSize.iconHeroPlaceholder,
      ),
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
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isCompact ? KSize.heroVerticalPaddingCompact : KSize.heroVerticalPaddingWide,
      ),
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
            onTap: () => context.go(AppRoutes.catalog),
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

    // The record and the UN gift lead the legacy numbers.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatItem(
          value: feature.guinnessValue,
          label: feature.guinnessLabel,
          icon: Icons.emoji_events_outlined,
        ),
        const SizedBox(height: KSize.margin8x),
        const Divider(height: 1),
        const SizedBox(height: KSize.margin8x),
        _StatItem(
          value: feature.unGiftValue,
          label: feature.unGiftLabel,
          icon: Icons.public_outlined,
        ),
        const SizedBox(height: KSize.margin8x),
        const Divider(height: 1),
        const SizedBox(height: KSize.margin8x),
        _StatItem(value: feature.worksValue, label: feature.worksLabel),
        const SizedBox(height: KSize.margin8x),
        const Divider(height: 1),
        const SizedBox(height: KSize.margin8x),
        _StatItem(value: feature.panelsValue, label: feature.panelsLabel),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label, this.icon});

  final String value;
  final String label;

  /// Fills the value slot for rows that have no number (Guinness, UN gift).
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final hasNumber = value.isNotEmpty;

    // Leading slot: the animated number, or — when there's no number — an icon
    // so the row isn't left lopsided. Numbers sit on the text baseline; icons
    // centre against the label instead.
    final Widget leading;
    if (hasNumber) {
      leading = _AnimatedStatValue(value: value, style: context.textContent.statValue);
    } else if (icon != null) {
      leading = Icon(icon, size: KSize.statIconSize, color: context.colors.forestGreen);
    } else {
      return Text(label, style: context.textContent.statLabel);
    }

    return Row(
      crossAxisAlignment: hasNumber ? CrossAxisAlignment.baseline : CrossAxisAlignment.center,
      textBaseline: hasNumber ? TextBaseline.alphabetic : null,
      children: [
        leading,
        const SizedBox(width: KSize.margin4x),
        // Expanded so long localised labels (e.g. ru "Книга рекордов Гиннесса")
        // wrap onto a second line instead of overflowing the 3/7 column the
        // stat block lives in on narrower desktop widths.
        Expanded(child: Text(label, style: context.textContent.statLabel)),
      ],
    );
  }
}

/// Counts the numeric part of a stat value up from zero (e.g. "500+" animates
/// 0 → 500, keeping the "+" suffix). The animation fires the first time the
/// number scrolls into view, so visitors actually see it count rather than
/// finding it already settled below the fold. Non-numeric values render as-is.
class _AnimatedStatValue extends StatefulWidget {
  const _AnimatedStatValue({required this.value, required this.style});

  final String value;
  final TextStyle style;

  @override
  State<_AnimatedStatValue> createState() => _AnimatedStatValueState();
}

class _AnimatedStatValueState extends State<_AnimatedStatValue>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final int _target;
  late final String _prefix;
  late final String _suffix;
  late final bool _isNumeric;

  ScrollPosition? _scrollPosition;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _parse(widget.value);
    _controller = AnimationController(vsync: this, duration: KSize.durationStatCountUp);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isNumeric || _started) return;

    // Track the enclosing scrollable so the count-up fires when the number
    // first scrolls into view. Resolving here (rather than in a one-shot
    // post-frame) re-binds correctly if the scrollable changes.
    final position = Scrollable.maybeOf(context)?.position;
    if (position != _scrollPosition) {
      _scrollPosition?.removeListener(_maybeStart);
      _scrollPosition = position;
      _scrollPosition?.addListener(_maybeStart);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeStart());
  }

  void _parse(String raw) {
    final match = RegExp(r'\d+').firstMatch(raw);
    if (match == null) {
      _isNumeric = false;
      _target = 0;
      _prefix = '';
      _suffix = '';
      return;
    }
    _isNumeric = true;
    _target = int.parse(match.group(0)!);
    _prefix = raw.substring(0, match.start);
    _suffix = raw.substring(match.end);
  }

  void _maybeStart() {
    if (_started || !mounted) return;

    // No scrollable around us → everything is on screen already, just run.
    if (_scrollPosition == null) {
      _start();
      return;
    }

    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final topY = box.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.sizeOf(context).height;
    // Any part of the number within the viewport triggers the count.
    if (topY < screenHeight && topY + box.size.height > 0) {
      _start();
    }
  }

  void _start() {
    _started = true;
    _scrollPosition?.removeListener(_maybeStart);
    _controller.forward();
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_maybeStart);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isNumeric) {
      return Text(widget.value, style: widget.style);
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final current = (_target * Curves.easeOutCubic.transform(_controller.value)).round();
        return Text('$_prefix$current$_suffix', style: widget.style);
      },
    );
  }
}

// ─── Biography section ─────────────────────────────────────────────────────────────────────────────

class _BiographySection extends StatelessWidget {
  const _BiographySection({
    super.key,
    required this.isCompact,
    required this.tapestryMediaKey,
    required this.chernobylMediaKey,
  });

  final bool isCompact;

  /// Onboarding-tour anchors on the tapestry / Chernobyl photos.
  final GlobalKey tapestryMediaKey;
  final GlobalKey chernobylMediaKey;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final bio = context.t.bio;

    return Container(
      color: context.colors.bioBg,
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isCompact ? KSize.heroVerticalPaddingCompact : KSize.heroVerticalPaddingWide,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bio.name,
            style: context.textContent.bioName(
              isCompact ? KSize.bioNameCompact : KSize.bioNameWide,
            ),
          ),
          const SizedBox(height: KSize.margin3x),
          Text(bio.tagline, style: context.textContent.bioTagline),
          const SizedBox(height: KSize.margin8x),
          Text(bio.intro, style: context.textContent.bioIntro),
          const SizedBox(height: KSize.margin5x),
          _BioExternalLinkButton(
            url: AboutAuthorPageConstants.wikipediaUrl,
            label: bio.wikipediaLinkLabel,
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: AboutAuthorPageConstants.universalRealismPhotoIndex,
            child: _BioSubSection(
              title: bio.universalRealism.title,
              body: bio.universalRealism.body,
            ),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: AboutAuthorPageConstants.tapestryPhotoIndex,
            mediaKey: tapestryMediaKey,
            child: _TapestryCopy(),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: AboutAuthorPageConstants.chernobylPhotoIndex,
            mediaKey: chernobylMediaKey,
            child: _ChernobylCopy(),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSectionWithPhoto(
            isCompact: isCompact,
            photoIndex: AboutAuthorPageConstants.mosaicPhotoIndex,
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
    this.mediaKey,
  });

  final bool isCompact;
  final int photoIndex;
  final Widget child;

  /// Optional anchor on the photo so the onboarding tour can scroll to it
  /// and highlight it through the overlay scrim.
  final GlobalKey? mediaKey;

  @override
  Widget build(BuildContext context) {
    final photo = _AuthorPhoto(
      index: photoIndex,
      aspectRatio: isCompact ? KSize.bioPhotoCompactAspectRatio : KSize.bioPhotoWideAspectRatio,
      borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
      placeholderBackground: context.colors.bioBg,
      placeholderIcon: Icons.image_outlined,
      placeholderIconColor: context.colors.onDarkPlaceholderIcon,
      placeholderIconSize: KSize.iconHeroPlaceholder,
      heroTag: 'about-author-photo-$photoIndex',
      openFullscreenOnTap: true,
    );
    // Tour targets are wrapped in a RepaintBoundary so the onboarding overlay
    // can snapshot them; other sections render the photo directly.
    final media = mediaKey == null ? photo : RepaintBoundary(key: mediaKey, child: photo);

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
        const _BioExternalLinkButton(url: AboutAuthorPageConstants.tapestryExternalUrl),
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
        const _BioExternalLinkButton(url: AboutAuthorPageConstants.chernobylExternalUrl),
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
        const _BioExternalLinkButton(url: AboutAuthorPageConstants.mosaicExternalUrl),
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
              decoration: BoxDecoration(color: placeholderBackground, borderRadius: borderRadius),
              child: inner,
            ),
          ),
        );

        if (!hasPhoto || !openFullscreenOnTap) {
          return frame;
        }

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () =>
                FullscreenImageViewer.show(context, imagePathOrUrl: photo.url, heroTag: heroTag),
            child: frame,
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
    return const Center(child: AppLoader());
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
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(KSize.radiusDefault),
          bottomRight: Radius.circular(KSize.radiusDefault),
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
