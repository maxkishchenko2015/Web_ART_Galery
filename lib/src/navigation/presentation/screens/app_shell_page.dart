import 'dart:ui' show ImageFilter;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/nav_destinations.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/gallery_brand.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/language_switcher.dart';

class AppShellMenu extends StatelessWidget {
  const AppShellMenu({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // If a Firebase-backed feature settles into a no-content terminal
        // state (error or empty list) while the user is browsing it, bounce
        // them to the safe home page so they're never stuck on an orphaned
        // tab whose menu entry just disappeared.
        BlocListener<NewsListCubit, NewsListState>(
          listenWhen: (previous, current) =>
              !NavVisibility.newsIsSettledEmpty(previous) &&
              NavVisibility.newsIsSettledEmpty(current),
          listener: (context, _) {
            final path = GoRouterState.of(context).uri.path;
            if (path.startsWith(AppRoutes.news)) {
              context.go(AppRoutes.aboutAuthor);
            }
          },
        ),
        BlocListener<CatalogOfWorksCubit, CatalogOfWorksState>(
          listenWhen: (previous, current) =>
              !NavVisibility.catalogIsSettledEmpty(previous) &&
              NavVisibility.catalogIsSettledEmpty(current),
          listener: (context, _) {
            final path = GoRouterState.of(context).uri.path;
            if (path.startsWith(AppRoutes.catalog)) {
              context.go(AppRoutes.aboutAuthor);
            }
          },
        ),
      ],
      // Narrow rebuild guards keep the shell from churning on every Loading
      // tick — we only re-run layout when the news or catalog cubit crosses
      // the has-content / no-content boundary.
      child: BlocBuilder<NewsListCubit, NewsListState>(
        buildWhen: (previous, current) =>
            NavVisibility.newsHasContent(previous) != NavVisibility.newsHasContent(current) ||
            NavVisibility.newsIsSettledEmpty(previous) != NavVisibility.newsIsSettledEmpty(current),
        builder: (context, newsState) {
          return BlocBuilder<CatalogOfWorksCubit, CatalogOfWorksState>(
            buildWhen: (previous, current) =>
                NavVisibility.catalogHasContent(previous) !=
                    NavVisibility.catalogHasContent(current) ||
                NavVisibility.catalogIsSettledEmpty(previous) !=
                    NavVisibility.catalogIsSettledEmpty(current),
            builder: (context, catalogState) {
              final width = MediaQuery.sizeOf(context).width;
              final currentPath = GoRouterState.of(context).uri.path;
              final items = buildNavDestinations(
                context,
                hideNews: NavVisibility.newsIsSettledEmpty(newsState),
                hideCatalog: NavVisibility.catalogIsSettledEmpty(catalogState),
              );
              final selectedIndex = _selectedIndex(items, currentPath);

              if (width < KSize.adaptiveCompactBreakpoint) {
                return _MobileShell(items: items, selectedIndex: selectedIndex, child: child);
              }
              return _DesktopShell(
                items: items,
                selectedIndex: selectedIndex,
                // Section pages are full-bleed (they centre their own
                // content) and end with the full gallery footer themselves.
                isSectionPage: _sectionPaths.contains(currentPath),
                child: child,
              );
            },
          );
        },
      ),
    );
  }

  /// Top-level pages built with the full-bleed gallery layout + footer.
  /// Detail routes (`/news/<slug>`, `/catalog/<id>`) keep the clamped
  /// content width and the slim footer bar.
  static const Set<String> _sectionPaths = {
    AppRoutes.aboutAuthor,
    AppRoutes.news,
    AppRoutes.catalog,
    AppRoutes.films,
    AppRoutes.archive,
    AppRoutes.contacts,
  };

  int _selectedIndex(List<NavDestination> items, String currentPath) {
    final index = items.indexWhere(
      (item) => currentPath == item.location || currentPath.startsWith('${item.location}/'),
    );
    return index >= 0 ? index : 0;
  }
}

// ─── Desktop shell ────────────────────────────────────────────────────────────

class _DesktopShell extends StatelessWidget {
  const _DesktopShell({
    required this.child,
    required this.items,
    required this.selectedIndex,
    required this.isSectionPage,
  });

  final Widget child;
  final List<NavDestination> items;
  final int selectedIndex;
  final bool isSectionPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _GalleryHeader(
            items: items,
            selectedIndex: selectedIndex,
            onSelected: (i) => context.go(items[i].location),
          ),
          Expanded(
            child: isSectionPage
                ? child
                : Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: KSize.desktopMaxContentWidth),
                      child: child,
                    ),
                  ),
          ),
          if (!isSectionPage) const _GalleryFooterBar(),
        ],
      ),
    );
  }
}

// ─── Mobile shell ─────────────────────────────────────────────────────────────

/// Full-height content under a frosted app bar that slides away while
/// scrolling down and returns on scroll up (floating `SliverAppBar` feel,
/// done at shell level so every page gets it). Pages offset their first
/// content by `MediaQuery.paddingOf(context).top`, which the Scaffold sets to
/// the bar height via `extendBodyBehindAppBar`. The menu opens from the right
/// (burger on the right, as in the mobile design).
class _MobileShell extends StatefulWidget {
  const _MobileShell({required this.child, required this.items, required this.selectedIndex});

  final Widget child;
  final List<NavDestination> items;
  final int selectedIndex;

  @override
  State<_MobileShell> createState() => _MobileShellState();
}

class _MobileShellState extends State<_MobileShell> {
  bool _barVisible = true;

  @override
  void didUpdateWidget(_MobileShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    // A new page starts scrolled to the top — show the bar again.
    if (oldWidget.child != widget.child) {
      _barVisible = true;
    }
  }

  bool _onScroll(ScrollUpdateNotification notification) {
    // Only the page's own vertical scroll — not nested lists or carousels.
    if (notification.depth != 0 || notification.metrics.axis != Axis.vertical) {
      return false;
    }
    final delta = notification.scrollDelta ?? 0;
    final bool visible;
    if (notification.metrics.pixels <= KSize.mobileAppBarHeight) {
      visible = true; // Never leave an empty strip above the first content.
    } else if (delta > KSize.mobileAppBarToggleScrollDelta) {
      visible = false;
    } else if (delta < -KSize.mobileAppBarToggleScrollDelta) {
      visible = true;
    } else {
      visible = _barVisible;
    }
    if (visible != _barVisible) {
      setState(() => _barVisible = visible);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(KSize.mobileAppBarHeight),
        child: AnimatedSlide(
          offset: _barVisible ? Offset.zero : const Offset(0, -1),
          duration: KSize.durationMedium,
          curve: Curves.easeOut,
          child: AppBar(
            toolbarHeight: KSize.mobileAppBarHeight,
            automaticallyImplyLeading: false,
            titleSpacing: KSize.margin4x,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            // Frosted glass: blur whatever scrolls underneath, then tint it.
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: KSize.mobileAppBarBlurSigma,
                  sigmaY: KSize.mobileAppBarBlurSigma,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.shell.withValues(alpha: KSize.mobileAppBarTintOpacity),
                    border: Border(bottom: BorderSide(color: colors.onDarkOverlay)),
                  ),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
            title: GestureDetector(
              onTap: () => context.go(AppRoutes.aboutAuthor),
              child: const GalleryBrand(logoSize: KSize.avatarDefault, gap: KSize.margin3x),
            ),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(Icons.menu_rounded, size: KSize.iconL, color: colors.onDark),
                ),
              ),
              const SizedBox(width: KSize.margin2x),
            ],
          ),
        ),
      ),
      endDrawer: _GalleryDrawer(
        items: widget.items,
        selectedIndex: widget.selectedIndex,
        onSelected: (i) {
          Navigator.pop(context);
          context.go(widget.items[i].location);
        },
      ),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: _onScroll,
        child: widget.child,
      ),
    );
  }
}

// ─── Gallery header ───────────────────────────────────────────────────────────

class _GalleryHeader extends StatelessWidget {
  const _GalleryHeader({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<NavDestination> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = MediaQuery.sizeOf(context).width;
    final isMediumWidth = width < KSize.adaptiveDesktopHeaderBreakpoint;
    final contactsIndex = items.indexWhere((e) => e.location == AppRoutes.contacts);
    final navItems = items.where((e) => e.location != AppRoutes.contacts).toList();

    return Container(
      height: KSize.desktopHeaderHeight,
      decoration: BoxDecoration(
        color: colors.shell,
        border: Border(bottom: BorderSide(color: colors.onDarkOverlay)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMediumWidth ? KSize.homeGutterMedium : KSize.homeGutterWide,
      ),
      child: Row(
        children: [
          // Logo + gallery name
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onSelected(0),
              child: GalleryBrand(
                logoSize: isMediumWidth ? KSize.logoSizeMedium : KSize.avatarDefault,
                showTagline: !isMediumWidth,
                gap: isMediumWidth ? KSize.margin3x : KSize.margin4x,
              ),
            ),
          ),
          SizedBox(width: isMediumWidth ? KSize.margin4x : KSize.margin8x),
          // Navigation links (all except contacts)
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                primary: false,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final item in navItems)
                      _HeaderNavItem(
                        label: item.label,
                        selected: items.indexOf(item) == selectedIndex,
                        onTap: () => onSelected(items.indexOf(item)),
                        compact: isMediumWidth,
                      ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: isMediumWidth ? KSize.margin3x : KSize.margin6x),
          // Contacts CTA button
          if (contactsIndex >= 0)
            _ContactsButton(
              label: items[contactsIndex].label,
              selected: selectedIndex == contactsIndex,
              onTap: () => onSelected(contactsIndex),
              compact: isMediumWidth,
            ),
          SizedBox(width: isMediumWidth ? KSize.margin2x : KSize.margin6x),
          // Language switcher themed for dark background
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: colors.shell,
              textTheme: Theme.of(context).textTheme.apply(bodyColor: colors.onDark),
              iconTheme: IconThemeData(color: colors.onDark),
            ),
            child: const LanguageSwitcher(),
          ),
        ],
      ),
    );
  }
}

// ─── Header nav item ──────────────────────────────────────────────────────────

class _HeaderNavItem extends StatelessWidget {
  const _HeaderNavItem({
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
        onTap: onTap,
        child: Container(
          height: KSize.desktopHeaderHeight,
          margin: EdgeInsets.symmetric(horizontal: compact ? KSize.margin2x : KSize.margin4x),
          padding: EdgeInsets.symmetric(horizontal: compact ? KSize.margin1x : KSize.margin2x),
          alignment: Alignment.center,
          // Active section: a light underline flush with the header's edge.
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? colors.onDark : Colors.transparent,
                width: KSize.borderWidthSmall,
              ),
            ),
          ),
          child: Text(
            label,
            style: selected ? context.textOnDark.navLink : context.textOnDarkDim.navLink,
          ),
        ),
      ),
    );
  }
}

// ─── Contacts CTA button ──────────────────────────────────────────────────────

class _ContactsButton extends StatelessWidget {
  const _ContactsButton({
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
        onTap: onTap,
        child: AnimatedContainer(
          duration: KSize.durationFast,
          padding: EdgeInsets.symmetric(
            horizontal: compact ? KSize.margin4x : KSize.margin7x,
            vertical: KSize.margin3x,
          ),
          decoration: BoxDecoration(
            color: selected ? colors.onDarkDivider : Colors.transparent,
            border: Border.all(color: colors.onDarkMuted, width: KSize.borderWidthVerySmall),
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          ),
          child: Text(label.toUpperCase(), style: context.textOnDark.ctaLabel),
        ),
      ),
    );
  }
}

// ─── Mobile drawer ────────────────────────────────────────────────────────────

class _GalleryDrawer extends StatelessWidget {
  const _GalleryDrawer({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<NavDestination> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Drawer(
      backgroundColor: colors.shell,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(KSize.margin6x),
              child: GalleryBrand(logoSize: KSize.logoSizeLarge, showTagline: true),
            ),
            Divider(color: colors.onDarkDivider, height: KSize.borderWidthVerySmall),
            const SizedBox(height: KSize.margin2x),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  for (int i = 0; i < items.length; i++)
                    _DrawerNavItem(
                      item: items[i],
                      selected: i == selectedIndex,
                      onTap: () => onSelected(i),
                    ),
                ],
              ),
            ),
            Divider(color: colors.onDarkDivider, height: KSize.borderWidthVerySmall),
            Padding(
              padding: const EdgeInsets.all(KSize.margin6x),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: colors.shell,
                  textTheme: Theme.of(context).textTheme.apply(bodyColor: colors.onDark),
                  iconTheme: IconThemeData(color: colors.onDark),
                ),
                child: const LanguageSwitcher(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(KSize.margin6x, 0, KSize.margin6x, KSize.margin6x),
              child: Text(
                '© ${DateTime.now().year} ${context.t.app.title}',
                style: context.textOnDark.footerCopyright,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerNavItem extends StatelessWidget {
  const _DrawerNavItem({required this.item, required this.selected, required this.onTap});

  final NavDestination item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: KSize.margin6x, vertical: KSize.margin4x),
        decoration: BoxDecoration(
          color: selected ? colors.onDarkOverlay : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: selected ? colors.terracottaLight : Colors.transparent,
              width: KSize.borderWidthMedium,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              color: selected ? colors.onDark : colors.onDarkMuted,
              size: KSize.iconMS,
            ),
            const SizedBox(width: KSize.margin4x),
            Expanded(
              child: Text(
                item.label,
                style: selected ? context.textOnDark.drawerItem : context.textOnDarkDim.drawerItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Slim footer bar (desktop, inner pages) ───────────────────────────────────

class _GalleryFooterBar extends StatelessWidget {
  const _GalleryFooterBar();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: colors.shell,
        border: Border(top: BorderSide(color: colors.onDarkOverlay)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: KSize.homeGutterWide,
        vertical: KSize.margin3x,
      ),
      child: Row(
        children: [
          const GalleryBrand(
            logoSize: KSize.logoSizeCompact,
            showTagline: false,
            gap: KSize.margin3x,
          ),
          const Spacer(),
          Text(
            '© ${DateTime.now().year} ${context.t.app.title}',
            style: context.textOnDark.footerCopyright,
          ),
        ],
      ),
    );
  }
}
