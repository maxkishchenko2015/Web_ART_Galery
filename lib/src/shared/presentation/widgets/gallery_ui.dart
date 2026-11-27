import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Responsive metrics of the gallery pages, derived from the page width.
///
/// Top-level pages are full-bleed (section backgrounds span the whole window);
/// on screens wider than [KSize.desktopMaxContentWidth] the [gutter] grows
/// so the content itself stays centred at that width.
@immutable
class PageLayout {
  const PageLayout(this.width);

  final double width;

  /// Phone layout (mobile shell): stacked hero, carousels, icon-only links.
  bool get isPhone => width < KSize.adaptiveCompactBreakpoint;

  /// Desktop layout: side-by-side hero, card rows, tile strip.
  bool get isWide => width >= KSize.homeWideBreakpoint;

  /// Width the content is laid out in (window width, capped).
  double get contentWidth => math.min(width, KSize.desktopMaxContentWidth);

  double get gutter {
    final base = isPhone
        ? KSize.homeGutterCompact
        : isWide
        ? KSize.homeGutterWide
        : KSize.homeGutterMedium;
    return base + (width - contentWidth) / 2;
  }

  double get sectionGap => isPhone ? KSize.homeSectionGapCompact : KSize.homeSectionGapWide;

  /// Section titles ("Мир образов Кищенко") scale between phone and desktop.
  double get sectionTitleSize => isPhone ? KSize.fontSize2XL + 2 : KSize.br6fontSize4XLHalf;
}

/// Uppercase letter-spaced section label with an optional trailing rule
/// ("О ХУДОЖНИКЕ ——").
class GalleryEyebrow extends StatelessWidget {
  const GalleryEyebrow({super.key, required this.text, this.onDark = false, this.showRule = true});

  final String text;
  final bool onDark;
  final bool showRule;

  @override
  Widget build(BuildContext context) {
    final style = onDark ? context.textOnDark.heroEyebrow : context.textContent.eyebrow;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Text(text.toUpperCase(), style: style)),
        if (showRule) ...[
          const SizedBox(width: KSize.margin4x),
          Container(
            width: KSize.homeEyebrowRuleWidth,
            height: KSize.borderWidthVerySmall,
            color: style.color,
          ),
        ],
      ],
    );
  }
}

/// Terracotta uppercase link with a trailing arrow and a thin underline
/// ("ПОДРОБНЕЕ ОБ АВТОРЕ →").
class GalleryArrowLink extends StatelessWidget {
  const GalleryArrowLink({
    super.key,
    required this.label,
    required this.onTap,
    this.uppercase = true,
  });

  final String label;
  final VoidCallback onTap;
  final bool uppercase;

  @override
  Widget build(BuildContext context) {
    final style = context.textContent.homeLink;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSize.margin1x),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(bottom: KSize.marginHalf),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: style.color!.withValues(alpha: 0.45),
                        width: KSize.borderWidthVerySmall,
                      ),
                    ),
                  ),
                  child: Text(uppercase ? label.toUpperCase() : label, style: style),
                ),
              ),
              const SizedBox(width: KSize.margin2x),
              Icon(Icons.arrow_forward_rounded, size: KSize.iconMS, color: style.color),
            ],
          ),
        ),
      ),
    );
  }
}

/// Rounded pill button for dark surfaces: filled terracotta (primary) or
/// outlined (secondary). Stretches to its parent's width when [expand].
class GalleryPillButton extends StatefulWidget {
  const GalleryPillButton({
    super.key,
    required this.label,
    required this.onTap,
    this.filled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.expand = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool filled;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool expand;

  @override
  State<GalleryPillButton> createState() => _GalleryPillButtonState();
}

class _GalleryPillButtonState extends State<GalleryPillButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final onColor = widget.filled ? colors.onAccent : colors.onDark;
    final fill = widget.filled
        ? (_hovered ? colors.terracottaLight : colors.terracotta)
        : (_hovered ? colors.onDarkOverlay : Colors.transparent);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: KSize.durationFast,
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin7x, vertical: KSize.margin4x),
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
            border: Border.all(
              color: widget.filled ? Colors.transparent : colors.onDarkMuted,
              width: KSize.borderWidthVerySmall,
            ),
          ),
          child: Row(
            mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.leadingIcon != null) ...[
                Icon(widget.leadingIcon, size: KSize.iconMS, color: onColor),
                const SizedBox(width: KSize.margin3x),
              ],
              Flexible(
                child: Text(
                  widget.label.toUpperCase(),
                  style: context.textOnDark.pillButtonLabel(onAccent: widget.filled),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (widget.trailingIcon != null) ...[
                const SizedBox(width: KSize.margin3x),
                Icon(widget.trailingIcon, size: KSize.iconMS, color: onColor),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Raised parchment card with the gallery border, radius and soft shadow.
class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key, required this.child, this.padding, this.onTap, this.color});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final card = Container(
      decoration: BoxDecoration(
        color: color ?? colors.parchmentCard,
        borderRadius: BorderRadius.circular(KSize.homeCardRadius),
        border: Border.all(color: colors.parchmentLine),
        boxShadow: [
          BoxShadow(
            color: colors.cardShadow,
            blurRadius: KSize.margin6x,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: padding ?? const EdgeInsets.all(KSize.margin4x),
      child: child,
    );
    final onTap = this.onTap;
    if (onTap == null) return card;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: onTap, child: card),
    );
  }
}

/// Small rounded label chip ("Источник: YOUTUBE", "mkram.ru").
class GalleryTagChip extends StatelessWidget {
  const GalleryTagChip({super.key, required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: KSize.margin3x, vertical: KSize.margin1Halfx),
      decoration: BoxDecoration(
        color: colors.cream,
        borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: KSize.iconS, color: colors.terracotta),
            const SizedBox(width: KSize.margin1Halfx),
          ],
          Flexible(
            child: Text(
              label,
              style: context.textContent.chipLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Pill filter chip: filled terracotta when [selected], outlined otherwise.
class GalleryFilterChip extends StatelessWidget {
  const GalleryFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.compact = false,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: KSize.durationFast,
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
            horizontal: compact ? KSize.margin5x : KSize.margin7x,
            vertical: compact ? KSize.margin2Halfx : KSize.margin3x,
          ),
          decoration: BoxDecoration(
            color: selected ? colors.terracotta : Colors.transparent,
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
            border: Border.all(
              color: selected ? colors.terracotta : colors.contentMuted.withValues(alpha: 0.5),
            ),
          ),
          child: Text(
            label,
            style: context.textContent.filterChipLabel.copyWith(
              color: selected ? colors.onAccent : colors.darkText,
            ),
          ),
        ),
      ),
    );
  }
}

/// Outlined circular arrow button used on catalog cards.
class GalleryCircleArrow extends StatelessWidget {
  const GalleryCircleArrow({super.key, this.size = KSize.avatarXSHalf + KSize.margin1x});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colors.terracotta.withValues(alpha: 0.6)),
      ),
      alignment: Alignment.center,
      child: Icon(Icons.arrow_forward_rounded, size: size * 0.5, color: colors.terracotta),
    );
  }
}

/// One entry of [GalleryQuickLinks].
@immutable
class GalleryQuickLink {
  const GalleryQuickLink({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
}

/// Row of section shortcuts between hairlines. Desktop: icon + title +
/// subtitle + arrow per cell; tablet: two per row; phone: icon over label.
class GalleryQuickLinks extends StatelessWidget {
  const GalleryQuickLinks({super.key, required this.layout, required this.links});

  final PageLayout layout;
  final List<GalleryQuickLink> links;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final divider = VerticalDivider(
      width: layout.isPhone ? KSize.borderWidthVerySmall : KSize.margin6x,
      thickness: KSize.borderWidthVerySmall,
      color: colors.parchmentLine,
    );

    // Tablet: two per row keeps the subtitles readable.
    if (!layout.isPhone && !layout.isWide) {
      final rows = <List<GalleryQuickLink>>[
        for (var i = 0; i < links.length; i += 2) links.sublist(i, math.min(i + 2, links.length)),
      ];
      return _Hairlines(
        child: Column(
          children: [
            for (final (index, row) in rows.indexed) ...[
              if (index > 0) Divider(color: colors.parchmentLine, height: KSize.margin6x),
              IntrinsicHeight(
                child: Row(
                  children: [
                    for (final (i, link) in row.indexed) ...[
                      if (i > 0) divider,
                      Expanded(child: _QuickLinkTile(link: link, compact: false)),
                    ],
                    if (row.length == 1) ...[divider, const Spacer()],
                  ],
                ),
              ),
            ],
          ],
        ),
      );
    }

    return _Hairlines(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final (i, link) in links.indexed) ...[
              if (i > 0) divider,
              Expanded(
                child: _QuickLinkTile(link: link, compact: layout.isPhone),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Hairlines extends StatelessWidget {
  const _Hairlines({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final line = BorderSide(color: context.colors.parchmentLine);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: KSize.margin5x),
      decoration: BoxDecoration(
        border: Border(top: line, bottom: line),
      ),
      child: child,
    );
  }
}

class _QuickLinkTile extends StatefulWidget {
  const _QuickLinkTile({required this.link, required this.compact});

  final GalleryQuickLink link;
  final bool compact;

  @override
  State<_QuickLinkTile> createState() => _QuickLinkTileState();
}

class _QuickLinkTileState extends State<_QuickLinkTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final link = widget.link;
    final text = context.textContent;

    final Widget body;
    if (widget.compact) {
      body = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(link.icon, size: KSize.homeQuickLinkIconCompact, color: colors.terracotta),
          const SizedBox(height: KSize.margin2x),
          Text(
            link.title,
            style: text.quickLinkLabelCompact,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    } else {
      body = Row(
        children: [
          Icon(link.icon, size: KSize.homeQuickLinkIcon, color: colors.terracotta),
          const SizedBox(width: KSize.margin4x),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(link.title, style: text.quickLinkTitle),
                const SizedBox(height: KSize.margin1x),
                Text(link.subtitle, style: text.quickLinkSubtitle),
              ],
            ),
          ),
          const SizedBox(width: KSize.margin2x),
          AnimatedSlide(
            duration: KSize.durationFast,
            offset: Offset(_hovered ? 0.25 : 0, 0),
            child: Icon(Icons.arrow_forward_rounded, size: KSize.iconMS, color: colors.terracotta),
          ),
        ],
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: link.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? KSize.margin1x : KSize.margin2x,
            vertical: KSize.margin1x,
          ),
          child: body,
        ),
      ),
    );
  }
}
