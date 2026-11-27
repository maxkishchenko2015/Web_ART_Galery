import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page_constants.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/page_chrome.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';
import 'package:web_art_galery/src/shared/telemetry/analytics_events.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      MetaSEO()
        ..ogTitle(ogTitle: context.t.seo.contacts.title)
        ..description(description: context.t.seo.contacts.description)
        ..keywords(keywords: context.t.seo.contacts.keywords);
    }

    return GalleryPageScaffold(
      hero: (layout) => PageHero(
        layout: layout,
        eyebrow: context.t.navigation.contacts,
        title: context.t.contacts.title,
        subtitle: context.t.pages.contacts.subtitle,
      ),
      sections: (context, layout) => [
        Padding(
          padding: EdgeInsets.fromLTRB(layout.gutter, layout.sectionGap, layout.gutter, 0),
          child: _ContactCards(layout: layout),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            layout.gutter,
            layout.sectionGap,
            layout.gutter,
            layout.sectionGap + KSize.margin4x,
          ),
          child: _StudioCard(layout: layout),
        ),
      ],
    );
  }
}

// ─── Contact cards ───────────────────────────────────────────────────────────

class _ContactCards extends StatelessWidget {
  const _ContactCards({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final gap = layout.isPhone ? KSize.margin3x : KSize.margin5x;
    final cards = <Widget>[
      _PhoneCard(isPhone: layout.isPhone),
      _InstagramCard(isPhone: layout.isPhone),
      _VkCard(isPhone: layout.isPhone),
    ];

    if (!layout.isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (i, card) in cards.indexed) ...[if (i > 0) SizedBox(height: gap), card],
        ],
      );
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 10, child: cards[0]),
          SizedBox(width: gap),
          Expanded(flex: 10, child: cards[1]),
          SizedBox(width: gap),
          Expanded(flex: 12, child: cards[2]),
        ],
      ),
    );
  }
}

/// Card shell: round icon badge, serif title, muted hint, then [values].
class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.isPhone,
    required this.icon,
    required this.title,
    required this.hint,
    required this.values,
    this.trailing,
  });

  final bool isPhone;
  final Widget icon;
  final String title;
  final String hint;
  final List<Widget> values;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final badgeSize = isPhone ? KSize.avatarM : KSize.avatarL;
    final trailing = this.trailing;

    return GalleryCard(
      padding: EdgeInsets.all(isPhone ? KSize.margin4x : KSize.margin6x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: badgeSize,
            height: badgeSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: const Alignment(-0.3, -0.4),
                colors: [colors.cream, colors.parchmentLine],
              ),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          SizedBox(width: isPhone ? KSize.margin4x : KSize.margin5x),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textContent.homeTitle(
                    isPhone ? KSize.fontSizeL : KSize.fontSizeXL,
                  ),
                ),
                const SizedBox(height: KSize.margin1x),
                Text(hint, style: context.textContent.quickLinkSubtitle),
                const SizedBox(height: KSize.margin3x),
                for (final value in values) ...[value, const SizedBox(height: KSize.margin1Halfx)],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: KSize.margin3x),
            VerticalDivider(width: KSize.margin5x, color: colors.parchmentLine),
            const SizedBox(width: KSize.margin3x),
            Center(child: trailing),
          ],
        ],
      ),
    );
  }
}

class _ContactIcon extends StatelessWidget {
  const _ContactIcon({this.icon, this.svgAsset});

  final IconData? icon;
  final String? svgAsset;

  @override
  Widget build(BuildContext context) {
    final color = context.colors.darkOlive;
    final asset = svgAsset;
    if (asset != null) {
      return SvgPicture.asset(
        asset,
        width: KSize.iconM,
        height: KSize.iconM,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }
    return Icon(icon, size: KSize.iconM, color: color);
  }
}

/// Tappable contact value ("+375 29 …", "@kishchenko.art") with an
/// outward arrow.
class _LinkValue extends StatelessWidget {
  const _LinkValue({required this.label, required this.url, required this.channel});

  final String label;
  final String url;

  /// Analytics channel: `phone`, `instagram`, `vk`.
  final String channel;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          AnalyticsEvents.contactClicked(channel: channel, origin: 'contacts');
          UrlLauncherUtils.launchUrlIfPossible(url: url);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                style: context.textContent.contactValue,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: KSize.margin2x),
            Icon(Icons.arrow_outward_rounded, size: KSize.iconS, color: context.colors.terracotta),
          ],
        ),
      ),
    );
  }
}

class _PhoneCard extends StatelessWidget {
  const _PhoneCard({required this.isPhone});

  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return _ContactCard(
      isPhone: isPhone,
      icon: const _ContactIcon(icon: Icons.phone_outlined),
      title: t.pages.contacts.phoneTitle,
      hint: t.contacts.phoneSectionHint,
      values: const [
        _LinkValue(
          label: ContactsPageConstants.phone1Display,
          url: ContactsPageConstants.phone1Tel,
          channel: 'phone',
        ),
        _LinkValue(
          label: ContactsPageConstants.phone2Display,
          url: ContactsPageConstants.phone2Tel,
          channel: 'phone',
        ),
      ],
    );
  }
}

class _InstagramCard extends StatelessWidget {
  const _InstagramCard({required this.isPhone});

  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return _ContactCard(
      isPhone: isPhone,
      icon: const _ContactIcon(svgAsset: ContactsPageConstants.instagramSvgAsset),
      title: t.contacts.instagramSectionLabel,
      hint: t.pages.contacts.instagramHint,
      values: [
        _LinkValue(
          label: t.contacts.instagramHandle,
          url: ContactsPageConstants.instagramUrl,
          channel: 'instagram',
        ),
      ],
    );
  }
}

class _VkCard extends StatelessWidget {
  const _VkCard({required this.isPhone});

  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final qrSize = isPhone ? KSize.contactsQrSize - KSize.margin6x : KSize.contactsQrSize;

    return _ContactCard(
      isPhone: isPhone,
      icon: const _ContactIcon(svgAsset: ContactsPageConstants.vkSvgAsset),
      title: t.contacts.vkSectionLabel,
      hint: isPhone ? t.contacts.vkScanQrHint : t.pages.contacts.vkHint,
      values: [
        _LinkValue(label: t.contacts.vkHandle, url: ContactsPageConstants.vkUrl, channel: 'vk'),
      ],
      trailing: Semantics(
        label: t.contacts.vkScanQrHint,
        image: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(KSize.radiusSmall),
          child: Image.asset(
            ContactsPageConstants.vkQrAsset,
            width: qrSize,
            height: qrSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

// ─── Studio ──────────────────────────────────────────────────────────────────

class _StudioCard extends StatelessWidget {
  const _StudioCard({required this.layout});

  final PageLayout layout;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final colors = context.colors;
    final isPhone = layout.isPhone;
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GalleryEyebrow(text: t.pages.contacts.studioLabel),
        const SizedBox(height: KSize.margin3x),
        Text(
          t.contacts.studioSectionTitle,
          style: context.textContent.homeTitle(layout.sectionTitleSize),
        ),
        const SizedBox(height: KSize.margin4x),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.place_outlined, size: KSize.iconM, color: colors.terracotta),
            const SizedBox(width: KSize.margin2x),
            Expanded(child: Text(t.contacts.studioAddress, style: context.textContent.homeBody)),
          ],
        ),
        const SizedBox(height: KSize.margin5x),
        GalleryArrowLink(
          label: t.contacts.openInOsm,
          onTap: () {
            AnalyticsEvents.contactClicked(channel: 'map', origin: 'contacts');
            UrlLauncherUtils.launchUrlIfPossible(url: ContactsPageConstants.osmUrl);
          },
        ),
      ],
    );
    final map = _StudioMap(
      height: isPhone ? KSize.contactsMapHeightPhone : KSize.contactsMapHeightWide,
    );

    return GalleryCard(
      padding: EdgeInsets.all(isPhone ? KSize.margin3x : KSize.margin5x),
      child: layout.isWide
          ? Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(padding: const EdgeInsets.all(KSize.margin4x), child: copy),
                ),
                const SizedBox(width: KSize.margin6x),
                Expanded(flex: 7, child: map),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: const EdgeInsets.all(KSize.margin2x), child: copy),
                const SizedBox(height: KSize.margin4x),
                map,
              ],
            ),
    );
  }
}

class _StudioMap extends StatelessWidget {
  const _StudioMap({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: height,
          // The map is rendered as a static "screenshot" with the studio
          // marker — no panning, zooming, taps or rotation. Tile fetch
          // failures are swallowed so they don't bubble up to telemetry as
          // fatal errors (the OSM CDN occasionally rejects browser fetches).
          child: ClipRRect(
            borderRadius: BorderRadius.circular(KSize.radiusDefaultMedium),
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
                        width: KSize.margin9x,
                        height: KSize.margin9x,
                        alignment: Alignment.topCenter,
                        child: Icon(Icons.place, size: KSize.margin9x, color: colors.terracotta),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: KSize.margin2x),
        Text(context.t.contacts.mapAttribution, style: context.textContent.homeMeta),
      ],
    );
  }
}
