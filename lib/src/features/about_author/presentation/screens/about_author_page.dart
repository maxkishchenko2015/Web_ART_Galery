import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_theme.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class AboutAuthorPage extends StatelessWidget {
  const AboutAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < KSize.adaptiveExpandedBreakpoint;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _HeroSection(isCompact: isCompact),
          _FeatureSection(isCompact: isCompact),
        ],
      ),
    );
  }
}

// ─── Hero section ─────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.isCompact});

  final bool isCompact;

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
        Expanded(flex: 5, child: _HeroText(headlineSize: headlineSize)),
        const SizedBox(width: KSize.margin12x),
        Expanded(flex: 3, child: _HeroImagePlaceholder()),
      ],
    );
  }

  Widget _buildCompactHero(BuildContext context, double headlineSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroText(headlineSize: headlineSize),
        const SizedBox(height: KSize.margin12x),
        _HeroImagePlaceholder(),
      ],
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.headlineSize});

  final double headlineSize;

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
        const SizedBox(height: KSize.margin6x),
        Text(
          'Dedicated to the artistic legacy of Ukrainian fine arts,\ncelebrating a lifetime of creative expression.',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            height: 1.7,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: KSize.margin9x),
        Wrap(
          spacing: KSize.margin4x,
          runSpacing: KSize.margin4x,
          children: [
            _HeroButton(label: 'VIEW CATALOG', filled: true, onTap: () => context.go('/catalog')),
            _HeroButton(label: 'LEARN MORE', filled: false, onTap: () {}),
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
