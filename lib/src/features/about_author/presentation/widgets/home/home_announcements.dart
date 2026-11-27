import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page_constants.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/config/remote_config/app_remote_config.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Opens [announcement] in a new tab and logs which one was opened.
Future<void> openAnnouncement(
  Announcement announcement, {
  required int position,
  required AppConfigSource source,
}) async {
  AppTelemetry.instance.logEvent(
    'announcement_opened',
    params: {
      'title': announcement.title,
      'host': announcement.host,
      'url': announcement.url,
      'position': position,
      'is_instagram': announcement.isInstagram,
      'config_source': source.name,
    },
  );
  final uri = Uri.tryParse(announcement.url);
  if (uri != null) await launchUrl(uri, webOnlyWindowName: '_blank');
}

/// Home-page carousel announcing third-party publications (Remote Config
/// `MAIN_NEWS`): one announcement per page, swipe / drag / arrows / dots,
/// auto-advancing while nobody interacts with it. Every page shown and every
/// opened link is tracked.
///
/// The desktop intro row measures it through `IntrinsicHeight`; the page
/// view therefore sits in a fixed-height box, which reports its intrinsic
/// height without asking the (scrollable) page view.
class HomeAnnouncementsCard extends StatefulWidget {
  const HomeAnnouncementsCard({
    super.key,
    required this.layout,
    required this.announcements,
    required this.source,
  });

  final PageLayout layout;
  final List<Announcement> announcements;
  final AppConfigSource source;

  @override
  State<HomeAnnouncementsCard> createState() => _HomeAnnouncementsCardState();
}

class _HomeAnnouncementsCardState extends State<HomeAnnouncementsCard> {
  /// Announcements already reported as seen during this page load.
  static final Set<String> _impressions = <String>{};

  final PageController _pageController = PageController();
  Timer? _autoAdvance;
  int _page = 0;
  bool _hovered = false;

  List<Announcement> get _items =>
      widget.announcements.take(KSize.homeAnnouncementsMax).toList(growable: false);

  @override
  void initState() {
    super.initState();
    _logImpression(0);
    _restartAutoAdvance();
  }

  @override
  void didUpdateWidget(HomeAnnouncementsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Remote Config replaced the list — start over from the first item.
    if (oldWidget.announcements != widget.announcements && _pageController.hasClients) {
      _page = 0;
      _pageController.jumpToPage(0);
      _logImpression(0);
      _restartAutoAdvance();
    }
  }

  @override
  void dispose() {
    _autoAdvance?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _restartAutoAdvance() {
    _autoAdvance?.cancel();
    if (_items.length < 2) return;
    _autoAdvance = Timer.periodic(KSize.durationAnnouncementAutoAdvance, (_) {
      if (_hovered || !_pageController.hasClients) return;
      _goTo((_page + 1) % _items.length);
    });
  }

  void _goTo(int page) {
    if (!_pageController.hasClients) return;
    _pageController.animateToPage(
      page,
      duration: KSize.durationScroll,
      curve: Curves.easeInOutCubic,
    );
  }

  void _onPageChanged(int page) {
    setState(() => _page = page);
    _logImpression(page);
  }

  void _logImpression(int page) {
    final items = _items;
    if (page >= items.length) return;
    final item = items[page];
    if (!_impressions.add(item.url)) return;
    AppTelemetry.instance.logEvent(
      'announcement_impression',
      params: {
        'title': item.title,
        'position': page + 1,
        'count': items.length,
        'is_instagram': item.isInstagram,
        'config_source': widget.source.name,
      },
    );
  }

  /// User-driven navigation (arrows, dots): also resets the auto timer.
  void _userGoTo(int page) {
    _goTo(page);
    _restartAutoAdvance();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = widget.layout;
    final isPhone = layout.isPhone;
    final items = _items;
    final multiple = items.length > 1;
    final radius = BorderRadius.circular(KSize.homeCardRadius);

    // Pages only need room for a teaser when some announcement has one.
    final hasTeaser = items.any((a) => a.description != null);
    final pageHeight = isPhone
        ? (hasTeaser
              ? KSize.homeAnnouncementPageHeightPhone
              : KSize.homeAnnouncementPageHeightPhoneCompact)
        : (hasTeaser ? KSize.homeAnnouncementPageHeight : KSize.homeAnnouncementPageHeightCompact);
    final pager = SizedBox(
      height: pageHeight,
      child: ScrollConfiguration(
        // Drag with a mouse / trackpad too, not only touch.
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          dragDevices: const {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.stylus,
          },
        ),
        child: NotificationListener<ScrollStartNotification>(
          onNotification: (notification) {
            if (notification.dragDetails != null) _restartAutoAdvance();
            return false;
          },
          child: PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) => _AnnouncementPage(
              announcement: items[index],
              isPhone: isPhone,
              onTap: () =>
                  openAnnouncement(items[index], position: index + 1, source: widget.source),
            ),
          ),
        ),
      ),
    );

    return MouseRegion(
      onEnter: (_) => _hovered = true,
      onExit: (_) => _hovered = false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(color: colors.parchmentLine),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colors.parchmentCard, colors.cream],
          ),
          boxShadow: [
            BoxShadow(
              color: colors.cardShadow,
              blurRadius: KSize.margin6x,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: Stack(
            children: [
              // Oversized quotation mark as a quiet backdrop.
              Positioned(
                right: KSize.margin4x,
                top: -KSize.margin10x,
                child: IgnorePointer(
                  child: Text(
                    '”',
                    style: context.textContent
                        .homeTitle(KSize.homeAnnouncementQuoteSize)
                        .copyWith(color: colors.terracotta.withValues(alpha: 0.08), height: 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: isPhone ? KSize.margin4x : KSize.margin6x),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _hPad(isPhone)),
                      child: Row(
                        children: [
                          const _LiveDot(),
                          const SizedBox(width: KSize.margin3x),
                          Expanded(
                            child: GalleryEyebrow(
                              text: context.t.home.announcements.label,
                              showRule: !isPhone,
                            ),
                          ),
                          if (multiple)
                            Text(
                              '${_page + 1} / ${items.length}',
                              style: context.textContent.homeMeta,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: isPhone ? KSize.margin4x : KSize.margin5x),
                    // Desktop: fill whatever height the intro row gives the card.
                    if (layout.isWide) Expanded(child: pager) else pager,
                    if (multiple) ...[
                      SizedBox(height: isPhone ? KSize.margin3x : KSize.margin4x),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _hPad(isPhone)),
                        child: _PagerControls(
                          count: items.length,
                          page: _page,
                          showArrows: !isPhone,
                          onSelect: _userGoTo,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double _hPad(bool isPhone) => isPhone ? KSize.margin4x : KSize.margin7x;

/// One announcement: badge, title, publisher, optional teaser, CTA.
class _AnnouncementPage extends StatefulWidget {
  const _AnnouncementPage({required this.announcement, required this.isPhone, required this.onTap});

  final Announcement announcement;
  final bool isPhone;
  final VoidCallback onTap;

  @override
  State<_AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<_AnnouncementPage> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final t = context.t;
    final a = widget.announcement;
    final isPhone = widget.isPhone;
    final date = a.date;
    final cta = a.isInstagram ? t.films.watchOn.instagram : t.home.announcements.readCta;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        // Never overflows its page: a taller-than-expected teaser is clipped.
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: _hPad(isPhone)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Badge(announcement: a, size: isPhone ? KSize.avatarDefault : KSize.avatarM + 6),
                  const SizedBox(width: KSize.margin4x),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          a.displayTitle,
                          style: context.textContent.homeTitle(
                            isPhone ? KSize.fontSizeXL : KSize.fontSize3XL,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: KSize.margin1x),
                        Row(
                          children: [
                            Icon(
                              a.isInstagram ? Icons.play_circle_outline : Icons.public_rounded,
                              size: KSize.iconS,
                              color: colors.contentMuted,
                            ),
                            const SizedBox(width: KSize.margin1Halfx),
                            Flexible(
                              child: Text(
                                a.host,
                                style: context.textContent.homeMeta,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (a.isReel) ...[
                              const SizedBox(width: KSize.margin2x),
                              const GalleryTagChip(label: 'Reel'),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (a.description != null) ...[
                const SizedBox(height: KSize.margin3x),
                Text(
                  a.description!,
                  style: isPhone
                      ? context.textContent.homeBodyCompact
                      : context.textContent.homeBody,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              SizedBox(height: isPhone ? KSize.margin5x : KSize.margin6x),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: KSize.margin5x,
                runSpacing: KSize.margin3x,
                children: [
                  _ReadPill(label: cta, hovered: _hovered),
                  if (date != null)
                    Text(
                      MaterialLocalizations.of(context).formatMediumDate(date),
                      style: context.textContent.cardDate,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dots (active one stretched) and, on wider screens, prev / next arrows.
class _PagerControls extends StatelessWidget {
  const _PagerControls({
    required this.count,
    required this.page,
    required this.showArrows,
    required this.onSelect,
  });

  final int count;
  final int page;
  final bool showArrows;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        for (var i = 0; i < count; i++)
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onSelect(i),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSize.marginThreeQuarters,
                  vertical: KSize.margin2x,
                ),
                child: AnimatedContainer(
                  duration: KSize.durationMedium,
                  curve: Curves.easeOut,
                  width: i == page ? KSize.margin6x : KSize.margin2x,
                  height: KSize.margin2x,
                  decoration: BoxDecoration(
                    color: i == page
                        ? colors.terracotta
                        : colors.terracotta.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
                  ),
                ),
              ),
            ),
          ),
        const Spacer(),
        if (showArrows) ...[
          _ArrowButton(
            icon: Icons.arrow_back_rounded,
            onTap: () => onSelect((page - 1 + count) % count),
          ),
          const SizedBox(width: KSize.margin2x),
          _ArrowButton(
            icon: Icons.arrow_forward_rounded,
            onTap: () => onSelect((page + 1) % count),
          ),
        ],
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          width: KSize.avatarXSHalf + KSize.margin1x,
          height: KSize.avatarXSHalf + KSize.margin1x,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors.terracotta.withValues(alpha: 0.5)),
          ),
          child: Icon(icon, size: KSize.iconS, color: colors.terracotta),
        ),
      ),
    );
  }
}

/// Outlined accent pill that fills on hover: "Читать на сайте ↗".
class _ReadPill extends StatelessWidget {
  const _ReadPill({required this.label, required this.hovered});

  final String label;
  final bool hovered;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fg = hovered ? colors.onAccent : colors.terracotta;

    return AnimatedContainer(
      duration: KSize.durationFast,
      padding: const EdgeInsets.symmetric(horizontal: KSize.margin5x, vertical: KSize.margin2Halfx),
      decoration: BoxDecoration(
        color: hovered ? colors.terracotta : Colors.transparent,
        borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
        border: Border.all(color: colors.terracotta),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              label.toUpperCase(),
              style: context.textContent.homeLink.copyWith(color: fg),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: KSize.margin2x),
          Icon(Icons.arrow_outward_rounded, size: KSize.iconS, color: fg),
        ],
      ),
    );
  }
}

/// Publication badge: the Instagram logo on the brand gradient for
/// Instagram posts, otherwise a monogram of the publication's initial.
class _Badge extends StatelessWidget {
  const _Badge({required this.announcement, required this.size});

  final Announcement announcement;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (announcement.isInstagram) {
      return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.instagramYellow,
              AppColors.instagramOrange,
              AppColors.instagramPink,
              AppColors.instagramPurple,
              AppColors.instagramBlue,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          ContactsPageConstants.instagramSvgAsset,
          width: size * 0.5,
          height: size * 0.5,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      );
    }

    final words = announcement.title.trim().split(RegExp(r'\s+'));
    // Skip a leading article ("THE PARIS REVIEW" → "P").
    const articles = {'THE', 'LE', 'LA', 'DIE', 'DER', 'EL'};
    final word = words.length > 1 && articles.contains(words.first.toUpperCase())
        ? words[1]
        : words.first;
    final initial = word.isEmpty ? '•' : word.characters.first.toUpperCase();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.terracottaLight, colors.terracottaDeep],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: context.textContent
            .homeTitle(size * 0.46)
            .copyWith(color: colors.onAccent, height: 1),
      ),
    );
  }
}

/// Small pulsing "live" dot next to the section label.
class _LiveDot extends StatefulWidget {
  const _LiveDot();

  @override
  State<_LiveDot> createState() => _LiveDotState();
}

class _LiveDotState extends State<_LiveDot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: KSize.durationLivePulse,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = context.colors.terracotta;

    return SizedBox.square(
      dimension: KSize.margin3x,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ScaleTransition(
            scale: Tween<double>(begin: 0.6, end: 1.6).animate(_controller),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 0).animate(_controller),
              child: DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: const SizedBox.square(dimension: KSize.margin3x),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: const SizedBox.square(dimension: KSize.margin2x),
          ),
        ],
      ),
    );
  }
}
