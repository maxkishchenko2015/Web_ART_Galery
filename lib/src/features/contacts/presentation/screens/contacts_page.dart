import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page_constants.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < KSize.adaptiveExpandedBreakpoint;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ContactsHero(isCompact: isCompact),
          _ContactsCardsSection(isCompact: isCompact),
          _StudioSection(isCompact: isCompact),
        ],
      ),
    );
  }
}

// ─── Hero section ─────────────────────────────────────────────────────────────

class _ContactsHero extends StatelessWidget {
  const _ContactsHero({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final headlineSize = isCompact ? KSize.heroHeadlineCompact : KSize.heroHeadlineWide;
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.forestGreen, colors.darkOlive],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isCompact ? KSize.heroVerticalPaddingCompact : KSize.heroVerticalPaddingWide,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.navigation.contacts.toUpperCase(),
            style: context.textOnDark.heroSectionLabel,
          ),
          const SizedBox(height: KSize.margin4x),
          Text(
            context.t.contacts.title,
            style: context.textOnDark.heroHeadline(headlineSize),
          ),
          const SizedBox(height: KSize.margin3x),
          Container(
            width: KSize.heroDividerWidth,
            height: KSize.borderWidthSmallHalf,
            color: colors.onDarkBody,
          ),
          const SizedBox(height: KSize.margin3x),
          Text(context.t.contacts.tagline, style: context.textOnDark.heroSubtitle),
        ],
      ),
    );
  }
}

// ─── Contact cards (phones / Instagram / VK + QR) ────────────────────────────

class _ContactsCardsSection extends StatelessWidget {
  const _ContactsCardsSection({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colors.white, colors.bioBg],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isCompact ? KSize.heroVerticalPaddingCompact : KSize.heroVerticalPaddingWide,
      ),
      child: Wrap(
        spacing: KSize.margin5x,
        runSpacing: KSize.margin5x,
        alignment: WrapAlignment.start,
        children: const [_PhoneCard(), _InstagramCard(), _VkCard()],
      ),
    );
  }
}

/// Polished gradient card used for every contact channel.
///
/// Visual contract:
///  - subtle white → bioBg vertical gradient gives the card depth without
///    fighting the underlying section gradient;
///  - 1 px outline using the theme outlineVariant token;
///  - soft elevation shadow tinted with forestGreen for brand cohesion;
///  - icon hosted in a circular forestGreen-tinted pill — keeps the brand
///    accent visible at a glance while the rest of the card stays calm.
class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.label,
    required this.icon,
    required this.children,
    this.subtitle,
  });

  static const double _maxWidth = 360;

  final String label;
  final Widget icon;
  final String? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _maxWidth, minWidth: 240),
      child: Container(
        padding: const EdgeInsets.all(KSize.margin6x),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colors.white, colors.bioBg],
          ),
          borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: KSize.borderWidthVerySmall,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.forestGreen.withAlpha(20),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _IconPill(child: icon),
                const SizedBox(width: KSize.margin4x),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: context.textContent.bioSectionTitle),
                      if (subtitle != null && subtitle!.isNotEmpty) ...[
                        const SizedBox(height: KSize.margin1x),
                        Text(
                          subtitle!,
                          style: context.textContent.bioDetail,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: KSize.margin5x),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Circular gradient pill that hosts a brand glyph (phone / Instagram / VK).
class _IconPill extends StatelessWidget {
  const _IconPill({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.quoteBg, colors.forestGreen.withAlpha(36)],
        ),
        border: Border.all(
          color: colors.forestGreen.withAlpha(40),
          width: KSize.borderWidthVerySmall,
        ),
      ),
      child: Center(child: child),
    );
  }
}

class _PhoneCard extends StatelessWidget {
  const _PhoneCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return _ContactCard(
      label: context.t.contacts.phoneSectionLabel,
      subtitle: context.t.contacts.phoneSectionHint,
      icon: Icon(Icons.phone_outlined, size: KSize.iconM, color: colors.forestGreen),
      children: const [
        _TappablePhone(
          display: ContactsPageConstants.phone1Display,
          telUrl: ContactsPageConstants.phone1Tel,
        ),
        SizedBox(height: KSize.margin3x),
        _TappablePhone(
          display: ContactsPageConstants.phone2Display,
          telUrl: ContactsPageConstants.phone2Tel,
        ),
      ],
    );
  }
}

class _TappablePhone extends StatelessWidget {
  const _TappablePhone({required this.display, required this.telUrl});

  final String display;
  final String telUrl;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: telUrl),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(display, style: context.textContent.bioBody),
            const SizedBox(width: KSize.margin2x),
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

class _InstagramCard extends StatelessWidget {
  const _InstagramCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return _ContactCard(
      label: context.t.contacts.instagramSectionLabel,
      icon: SvgPicture.asset(
        ContactsPageConstants.instagramSvgAsset,
        width: KSize.iconM,
        height: KSize.iconM,
        colorFilter: ColorFilter.mode(colors.forestGreen, BlendMode.srcIn),
      ),
      children: [
        _ExternalLinkRow(
          label: context.t.contacts.instagramHandle,
          url: ContactsPageConstants.instagramUrl,
        ),
      ],
    );
  }
}

class _VkCard extends StatelessWidget {
  const _VkCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return _ContactCard(
      label: context.t.contacts.vkSectionLabel,
      icon: SvgPicture.asset(
        ContactsPageConstants.vkSvgAsset,
        width: KSize.iconM,
        height: KSize.iconM,
        colorFilter: ColorFilter.mode(colors.forestGreen, BlendMode.srcIn),
      ),
      children: [
        _ExternalLinkRow(
          label: context.t.contacts.vkHandle,
          url: ContactsPageConstants.vkUrl,
        ),
        const SizedBox(height: KSize.margin4x),
        Text(context.t.contacts.vkScanQrHint, style: context.textContent.bioDetail),
        const SizedBox(height: KSize.margin3x),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(KSize.radiusMedium),
              child: Image.asset(
                ContactsPageConstants.vkQrAsset,
                fit: BoxFit.contain,
                semanticLabel: context.t.contacts.vkScanQrHint,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExternalLinkRow extends StatelessWidget {
  const _ExternalLinkRow({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: url),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                style: context.textContent.bioBody,
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
    );
  }
}

// ─── Studio section (address + interactive OSM map) ──────────────────────────

class _StudioSection extends StatelessWidget {
  const _StudioSection({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final hPad = isCompact ? KSize.margin6x : KSize.margin12x * 2;
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colors.bioBg, colors.cream],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isCompact ? KSize.heroVerticalPaddingCompact : KSize.heroVerticalPaddingWide,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.t.contacts.studioSectionTitle,
                style: context.textContent.bioName(
                  isCompact ? KSize.bioNameCompact : KSize.bioNameWide,
                ),
              ),
              const SizedBox(width: KSize.margin5x),
              Expanded(
                child: Container(
                  height: KSize.borderWidthSmallHalf,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colors.forestGreen.withAlpha(60),
                        colors.forestGreen.withAlpha(0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: KSize.margin8x),
          isCompact ? _buildCompact(context) : _buildWide(context),
        ],
      ),
    );
  }

  Widget _buildWide(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 4, child: _AddressCard(isCompact: false)),
        const SizedBox(width: KSize.margin8x),
        Expanded(flex: 6, child: _StudioMap(isCompact: false)),
      ],
    );
  }

  Widget _buildCompact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _AddressCard(isCompact: true),
        const SizedBox(height: KSize.margin5x),
        _StudioMap(isCompact: true),
      ],
    );
  }
}

class _AddressCard extends StatelessWidget {
  const _AddressCard({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(KSize.margin6x),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.white, colors.bioBg],
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: KSize.borderWidthVerySmall,
        ),
        borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
        boxShadow: [
          BoxShadow(
            color: colors.forestGreen.withAlpha(20),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _IconPill(
                child: Icon(
                  Icons.place_outlined,
                  size: KSize.iconM,
                  color: colors.forestGreen,
                ),
              ),
              const SizedBox(width: KSize.margin4x),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: KSize.margin1x),
                  child: Text(
                    context.t.contacts.studioAddress,
                    style: context.textContent.bioBody,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: KSize.margin5x),
          _OpenInOsmLink(),
        ],
      ),
    );
  }
}

class _OpenInOsmLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final label = context.t.contacts.openInOsm;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: ContactsPageConstants.osmUrl),
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

class _StudioMap extends StatelessWidget {
  const _StudioMap({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final height = isCompact ? 280.0 : 380.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
            boxShadow: [
              BoxShadow(
                color: colors.forestGreen.withAlpha(28),
                blurRadius: 32,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          // The map is rendered as a static "screenshot" with the studio
          // marker — no panning, zooming, taps or rotation. Tile fetch
          // failures are swallowed so they don't bubble up to telemetry as
          // fatal errors (the OSM CDN occasionally rejects browser fetches).
          child: ClipRRect(
            borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
            child: IgnorePointer(
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: ContactsPageConstants.studioLatLng,
                  initialZoom: 16,
                  interactionOptions: InteractionOptions(flags: InteractiveFlag.none),
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: ContactsPageConstants.userAgentPackageName,
                    maxZoom: 19,
                    errorTileCallback: (_, _, _) {},
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: ContactsPageConstants.studioLatLng,
                        width: 36,
                        height: 36,
                        alignment: Alignment.topCenter,
                        child: Icon(
                          Icons.place,
                          size: 36,
                          color: colors.forestGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: KSize.margin2x),
        Text(
          context.t.contacts.mapAttribution,
          style: context.textContent.bioDetail,
        ),
      ],
    );
  }
}
