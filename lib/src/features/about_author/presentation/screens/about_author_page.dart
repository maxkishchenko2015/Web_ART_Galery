import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_theme.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class AboutAuthorPage extends StatefulWidget {
  const AboutAuthorPage({super.key});

  @override
  State<AboutAuthorPage> createState() => _AboutAuthorPageState();
}

class _AboutAuthorPageState extends State<AboutAuthorPage> {
  final _bioKey = GlobalKey();

  void _scrollToBio() {
    final ctx = _bioKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
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
      color: AppTheme.forestGreen,
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
        Expanded(flex: 3, child: _HeroImagePlaceholder()),
      ],
    );
  }

  Widget _buildCompactHero(BuildContext context, double headlineSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroText(headlineSize: headlineSize, onLearnMore: onLearnMore),
        const SizedBox(height: KSize.margin12x),
        _HeroImagePlaceholder(),
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
          style: GoogleFonts.roboto(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: KSize.margin4x),
        Text(
          context.t.app.title,
          style: GoogleFonts.roboto(
            fontSize: headlineSize,
            fontWeight: FontWeight.w300,
            height: 1.15,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: KSize.margin3x),
        Text(
          context.t.bio.heroTitle,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: KSize.margin4x),
        Text(
          context.t.bio.heroSubtitle,
          style: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            height: 1.7,
            color: Colors.white60,
          ),
        ),
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin8x, vertical: KSize.margin4x),
          decoration: BoxDecoration(
            color: filled ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          ),
          child: Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
              color: filled ? AppTheme.forestGreen : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroImagePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(KSize.radius3XL),
        bottom: Radius.circular(KSize.radius3XL),
      ),
      child: AspectRatio(
        aspectRatio: 0.75,
        child: Container(
          color: Colors.white10,
          child: Center(child: Icon(Icons.palette_outlined, size: 64, color: Colors.white24)),
        ),
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
      color: Colors.white,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A Legacy in\nUkrainian Art',
          style: GoogleFonts.roboto(
            fontSize: 34,
            fontWeight: FontWeight.w300,
            height: 1.2,
            color: AppTheme.darkOlive,
          ),
        ),
        const SizedBox(height: KSize.margin6x),
        Text(
          'The gallery preserves and presents the works of a distinguished Ukrainian artist, '
          'spanning decades of creative achievement. Each painting tells a story of life, '
          'culture, and the enduring spirit of artistic expression.',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            height: 1.75,
            color: const Color(0xFF5A5A5A),
          ),
        ),
        const SizedBox(height: KSize.margin9x),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => context.go('/catalog'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EXPLORE THE COLLECTION',
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    color: AppTheme.forestGreen,
                  ),
                ),
                const SizedBox(width: KSize.margin3x),
                const Icon(Icons.arrow_forward, size: 14, color: AppTheme.forestGreen),
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
    return Column(
      children: [
        _StatItem(value: '100+', label: 'Works of Art'),
        const SizedBox(height: KSize.margin8x),
        const Divider(height: 1),
        const SizedBox(height: KSize.margin8x),
        _StatItem(value: '60+', label: 'Years of Creativity'),
        const SizedBox(height: KSize.margin8x),
        const Divider(height: 1),
        const SizedBox(height: KSize.margin8x),
        _StatItem(value: '5', label: 'Decades of Heritage'),
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
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 36,
            fontWeight: FontWeight.w300,
            color: AppTheme.forestGreen,
          ),
        ),
        const SizedBox(width: KSize.margin4x),
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF7A7E78),
          ),
        ),
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
      color: const Color(0xFFF8F6F2),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: isCompact ? 48 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bio.name,
            style: GoogleFonts.roboto(
              fontSize: isCompact ? 24.0 : 34.0,
              fontWeight: FontWeight.w400,
              height: 1.2,
              color: AppTheme.darkOlive,
            ),
          ),
          const SizedBox(height: KSize.margin3x),
          Text(
            bio.tagline,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
              color: AppTheme.forestGreen,
            ),
          ),
          const SizedBox(height: KSize.margin8x),
          Text(
            bio.intro,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.75,
              color: const Color(0xFF4A4A4A),
            ),
          ),
          const SizedBox(height: KSize.margin12x),
          _BioSubSection(title: bio.universalRealism.title, body: bio.universalRealism.body),
          const SizedBox(height: KSize.margin12x),
          _BioSubSection(title: bio.tapestry.title, body: bio.tapestry.intro),
          const SizedBox(height: KSize.margin6x),
          _BioHighlightRow(label: bio.tapestry.scaleLabel, text: bio.tapestry.scale),
          const SizedBox(height: KSize.margin4x),
          _BioHighlightRow(label: bio.tapestry.conceptLabel, text: bio.tapestry.concept),
          const SizedBox(height: KSize.margin4x),
          _BioHighlightRow(label: bio.tapestry.meaningLabel, text: bio.tapestry.meaning),
          const SizedBox(height: KSize.margin12x),
          _BioSubSection(title: bio.chernobyl.title, body: bio.chernobyl.body),
          const SizedBox(height: KSize.margin12x),
          _BioSubSection(title: bio.mosaic.title, body: bio.mosaic.intro),
          const SizedBox(height: KSize.margin4x),
          _BioHighlightRow(label: bio.mosaic.panelsLabel, text: bio.mosaic.panels),
          const SizedBox(height: KSize.margin4x),
          Text(
            bio.mosaic.panelsMeaning,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.75,
              color: const Color(0xFF4A4A4A),
            ),
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

class _BioSubSection extends StatelessWidget {
  const _BioSubSection({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 40, height: 2, color: AppTheme.forestGreen),
        const SizedBox(height: KSize.margin4x),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.3,
            color: AppTheme.darkOlive,
          ),
        ),
        const SizedBox(height: KSize.margin4x),
        Text(
          body,
          style: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            height: 1.8,
            color: const Color(0xFF4A4A4A),
          ),
        ),
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
            width: 5,
            height: 5,
            margin: const EdgeInsets.only(top: 7, right: KSize.margin3x),
            decoration: const BoxDecoration(color: AppTheme.forestGreen, shape: BoxShape.circle),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.darkOlive,
                    ),
                  ),
                  TextSpan(
                    text: text,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.7,
                      color: const Color(0xFF4A4A4A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
      decoration: const BoxDecoration(
        color: Color(0xFFEDF3EF),
        border: Border(left: BorderSide(color: AppTheme.forestGreen, width: 3)),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              height: 1.75,
              color: AppTheme.darkOlive,
            ),
          ),
          const SizedBox(height: KSize.margin4x),
          Text(
            author,
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              color: AppTheme.forestGreen,
            ),
          ),
        ],
      ),
    );
  }
}
