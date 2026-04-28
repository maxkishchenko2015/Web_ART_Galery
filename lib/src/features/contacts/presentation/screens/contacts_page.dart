import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

const String _instagramUrl = 'https://www.instagram.com/kishchenko.art';
const String _vkUrl = 'https://vk.ru/aleksandrkishchenko';
const String _osmUrl =
    'https://www.openstreetmap.org/?mlat=53.927989&mlon=27.589894#map=18/53.927989/27.589894';

const String _phone1Display = '+375 29 502 02 46';
const String _phone1Tel = 'tel:+375295020246';
const String _phone2Display = '+375 29 277 57 13';
const String _phone2Tel = 'tel:+375292775713';

const LatLng _studioLatLng = LatLng(53.927989, 27.589894);
const String _userAgentPackageName = 'by.kishchanka.web_art_galery';

const String _instagramSvgAsset = 'assets/icons/instagram.svg';
const String _vkSvgAsset = 'assets/icons/vk.svg';
const String _vkQrAsset = 'assets/images/vk_qr.png';

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
    final headlineSize = isCompact ? 36.0 : 56.0;

    return Container(
      color: context.colors.forestGreen,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: isCompact ? 48 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.navigation.contacts.toUpperCase(),
            style: context.textOnDark.heroSectionLabel,
          ),
          const SizedBox(height: KSize.margin4x),
          Text(context.t.contacts.title, style: context.textOnDark.heroHeadline(headlineSize)),
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

    return Container(
      color: context.colors.white,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: isCompact ? 48 : 80),
      child: Wrap(
        spacing: KSize.margin5x,
        runSpacing: KSize.margin5x,
        alignment: WrapAlignment.start,
        children: const [_PhoneCard(), _InstagramCard(), _VkCard()],
      ),
    );
  }
}

/// Outlined card matching the catalog/painting card visual idiom.
///
/// Header: a brand glyph next to a section label.
/// Body: caller-provided rows (tappable values).
class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.label,
    required this.icon,
    required this.children,
  });

  static const double _maxWidth = 360;

  final String label;
  final Widget icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _maxWidth, minWidth: 240),
      child: Container(
        padding: const EdgeInsets.all(KSize.margin5x),
        decoration: BoxDecoration(
          color: context.colors.white,
          border: Border.all(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: KSize.iconL,
                  height: KSize.iconL,
                  child: Center(child: icon),
                ),
                const SizedBox(width: KSize.margin3x),
                Text(label, style: context.textContent.bioSectionTitle),
              ],
            ),
            const SizedBox(height: KSize.margin4x),
            ...children,
          ],
        ),
      ),
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
      icon: Icon(Icons.phone_outlined, size: KSize.iconM, color: colors.forestGreen),
      children: [
        _TappablePhone(display: _phone1Display, telUrl: _phone1Tel),
        const SizedBox(height: KSize.margin2x),
        _TappablePhone(
          display: _phone2Display,
          telUrl: _phone2Tel,
          hint: context.t.contacts.phoneHint,
        ),
      ],
    );
  }
}

class _TappablePhone extends StatelessWidget {
  const _TappablePhone({required this.display, required this.telUrl, this.hint});

  final String display;
  final String telUrl;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Semantics(
        button: true,
        link: true,
        label: display,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: telUrl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(display, style: context.textContent.bioBody),
              if (hint != null && hint!.isNotEmpty) ...[
                const SizedBox(width: KSize.margin2x),
                Text(hint!, style: context.textContent.bioDetail),
              ],
            ],
          ),
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
        _instagramSvgAsset,
        width: KSize.iconM,
        height: KSize.iconM,
        colorFilter: ColorFilter.mode(colors.forestGreen, BlendMode.srcIn),
      ),
      children: [
        _ExternalLinkRow(
          label: context.t.contacts.instagramHandle,
          url: _instagramUrl,
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
        _vkSvgAsset,
        width: KSize.iconM,
        height: KSize.iconM,
        colorFilter: ColorFilter.mode(colors.forestGreen, BlendMode.srcIn),
      ),
      children: [
        _ExternalLinkRow(label: context.t.contacts.vkHandle, url: _vkUrl),
        const SizedBox(height: KSize.margin4x),
        Text(context.t.contacts.vkScanQrHint, style: context.textContent.bioDetail),
        const SizedBox(height: KSize.margin3x),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(KSize.radiusMedium),
              child: Image.asset(
                _vkQrAsset,
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

    return Container(
      color: context.colors.bioBg,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: isCompact ? 48 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.contacts.studioSectionTitle,
            style: context.textContent.bioName(isCompact ? 24.0 : 34.0),
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
      padding: const EdgeInsets.all(KSize.margin5x),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
        borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.place_outlined, size: KSize.iconL, color: colors.forestGreen),
              const SizedBox(width: KSize.margin3x),
              Expanded(
                child: Text(
                  context.t.contacts.studioAddress,
                  style: context.textContent.bioBody,
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
      child: Semantics(
        button: true,
        link: true,
        label: label,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: _osmUrl),
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
        SizedBox(
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(KSize.radiusLargeExtra),
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: _studioLatLng,
                initialZoom: 16,
                interactionOptions: InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: _userAgentPackageName,
                  maxZoom: 19,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _studioLatLng,
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
        const SizedBox(height: KSize.margin2x),
        Text(
          context.t.contacts.mapAttribution,
          style: context.textContent.bioDetail,
        ),
      ],
    );
  }
}
