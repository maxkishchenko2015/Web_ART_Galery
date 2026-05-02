import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/language_switcher.dart';

class AppShellMenu extends StatelessWidget {
  const AppShellMenu({super.key, required this.child});

  final Widget child;

  // A tab counts as "having content" only once its cubit has settled into a
  // Loaded state with a non-empty list. Initial/Loading keep the tab visible
  // so cold-start ticks don't flicker the menu, and Error/empty-Loaded both
  // hide the tab so users can't land on a blank page.
  static bool _newsHasContent(NewsListState s) =>
      s is NewsListLoaded && s.articles.isNotEmpty;

  static bool _catalogHasContent(CatalogOfWorksState s) =>
      s is CatalogOfWorksLoaded && s.paintings.isNotEmpty;

  static bool _newsIsSettledEmpty(NewsListState s) =>
      s is NewsListError || (s is NewsListLoaded && s.articles.isEmpty);

  static bool _catalogIsSettledEmpty(CatalogOfWorksState s) =>
      s is CatalogOfWorksError ||
      (s is CatalogOfWorksLoaded && s.paintings.isEmpty);

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
              !_newsIsSettledEmpty(previous) && _newsIsSettledEmpty(current),
          listener: (context, _) {
            final path = GoRouterState.of(context).uri.path;
            if (path.startsWith(AppRoutes.news)) {
              context.go(AppRoutes.aboutAuthor);
            }
          },
        ),
        BlocListener<CatalogOfWorksCubit, CatalogOfWorksState>(
          listenWhen: (previous, current) =>
              !_catalogIsSettledEmpty(previous) && _catalogIsSettledEmpty(current),
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
            _newsHasContent(previous) != _newsHasContent(current) ||
            _newsIsSettledEmpty(previous) != _newsIsSettledEmpty(current),
        builder: (context, newsState) {
          return BlocBuilder<CatalogOfWorksCubit, CatalogOfWorksState>(
            buildWhen: (previous, current) =>
                _catalogHasContent(previous) != _catalogHasContent(current) ||
                _catalogIsSettledEmpty(previous) != _catalogIsSettledEmpty(current),
            builder: (context, catalogState) {
              final hideNews = _newsIsSettledEmpty(newsState);
              final hideCatalog = _catalogIsSettledEmpty(catalogState);
              final width = MediaQuery.sizeOf(context).width;
              final currentPath = GoRouterState.of(context).uri.path;
              final items = _buildNavItems(
                context,
                hideNews: hideNews,
                hideCatalog: hideCatalog,
              );
              final selectedIndex = _selectedIndex(items, currentPath);

              if (width < KSize.adaptiveCompactBreakpoint) {
                return _MobileShell(
                  items: items,
                  selectedIndex: selectedIndex,
                  child: child,
                );
              }
              return _DesktopShell(
                items: items,
                selectedIndex: selectedIndex,
                child: child,
              );
            },
          );
        },
      ),
    );
  }

  List<_NavItem> _buildNavItems(
    BuildContext context, {
    required bool hideNews,
    required bool hideCatalog,
  }) => [
    _NavItem(
      label: context.t.navigation.aboutAuthor,
      location: AppRoutes.aboutAuthor,
      icon: Icons.person_outline,
    ),
    if (!hideNews)
      _NavItem(
        label: context.t.navigation.news,
        location: AppRoutes.news,
        icon: Icons.newspaper_outlined,
      ),
    if (!hideCatalog)
      _NavItem(
        label: context.t.navigation.catalogOfWorks,
        location: AppRoutes.catalog,
        icon: Icons.collections_bookmark_outlined,
      ),
    _NavItem(
      label: context.t.navigation.films,
      location: AppRoutes.films,
      icon: Icons.movie_outlined,
    ),
    _NavItem(
      label: context.t.navigation.archive,
      location: AppRoutes.archive,
      icon: Icons.archive_outlined,
    ),
    _NavItem(
      label: context.t.navigation.contacts,
      location: AppRoutes.contacts,
      icon: Icons.contacts_outlined,
    ),
  ];

  int _selectedIndex(List<_NavItem> items, String currentPath) {
    final index = items.indexWhere(
      (item) => currentPath == item.location || currentPath.startsWith('${item.location}/'),
    );
    return index >= 0 ? index : 0;
  }
}

// ─── Desktop shell ────────────────────────────────────────────────────────────

class _DesktopShell extends StatelessWidget {
  const _DesktopShell({required this.child, required this.items, required this.selectedIndex});

  final Widget child;
  final List<_NavItem> items;
  final int selectedIndex;

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
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: KSize.desktopMaxContentWidth),
                child: child,
              ),
            ),
          ),
          _GalleryFooter(items: items, onSelected: (i) => context.go(items[i].location)),
        ],
      ),
    );
  }
}

// ─── Mobile shell ─────────────────────────────────────────────────────────────

class _MobileShell extends StatelessWidget {
  const _MobileShell({required this.child, required this.items, required this.selectedIndex});

  final Widget child;
  final List<_NavItem> items;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: KSize.mobileAppBarHeight,
        title: Row(
          children: [
            const _GalleryLogo(size: KSize.logoSizeMedium),
            const SizedBox(width: KSize.margin3x),
            Text(context.t.app.title.toUpperCase(), style: context.textOnDark.brandTitle),
          ],
        ),
      ),
      drawer: _GalleryDrawer(
        items: items,
        selectedIndex: selectedIndex,
        onSelected: (i) {
          Navigator.pop(context);
          context.go(items[i].location);
        },
      ),
      body: Column(
        children: [
          Expanded(child: child),
          _GalleryFooter(
            items: items,
            onSelected: (i) => context.go(items[i].location),
            compact: true,
          ),
        ],
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

  final List<_NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMediumWidth = width < KSize.adaptiveDesktopHeaderBreakpoint;
    final contactsIndex = items.indexWhere((e) => e.location == AppRoutes.contacts);
    final navItems = items.where((e) => e.location != AppRoutes.contacts).toList();

    return Container(
      color: context.colors.forestGreen,
      height: KSize.desktopHeaderHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMediumWidth ? KSize.margin6x : KSize.margin12x),
        child: Row(
          children: [
            // Logo + gallery name
            GestureDetector(
              onTap: () => onSelected(0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Row(
                  children: [
                    _GalleryLogo(size: isMediumWidth ? KSize.logoSizeMedium : KSize.logoSizeLarge),
                    SizedBox(width: isMediumWidth ? KSize.margin3x : KSize.margin4x),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.t.app.title.toUpperCase(),
                          style: context.textOnDark.brandTitle,
                        ),
                        if (!isMediumWidth)
                          Text(
                            context.t.app.brandTagline,
                            style: context.textOnDark.brandSubtitle,
                          ),
                      ],
                    ),
                  ],
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
            SizedBox(width: isMediumWidth ? KSize.margin3x : KSize.margin6x),
            // Language switcher themed for dark background
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: context.colors.forestGreen,
                textTheme: Theme.of(context).textTheme.apply(bodyColor: context.colors.onDark),
                iconTheme: IconThemeData(color: context.colors.onDark),
              ),
              child: const LanguageSwitcher(),
            ),
          ],
        ),
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
          margin: EdgeInsets.only(right: compact ? KSize.margin4x : KSize.margin8x),
          padding: EdgeInsets.symmetric(
            vertical: KSize.margin3x,
            horizontal: compact ? KSize.margin1x : KSize.margin2x,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? colors.onDark : Colors.transparent,
                width: KSize.borderWidthSmallHalf,
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
            horizontal: compact ? KSize.margin4x : KSize.margin6x,
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

// ─── Logo mark ────────────────────────────────────────────────────────────────

class _GalleryLogo extends StatelessWidget {
  const _GalleryLogo({this.size = KSize.logoSizeLarge});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colors.onDarkSubtle, width: KSize.borderWidthVerySmall),
      ),
      child: Center(
        child: Builder(
          builder: (context) =>
              Text(context.t.app.logoMark, style: context.textOnDark.logoMark(size)),
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

  final List<_NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.forestGreen,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(KSize.margin6x),
              child: Row(
                children: [
                  const _GalleryLogo(size: KSize.logoSizeLarge),
                  const SizedBox(width: KSize.margin4x),
                  Text(context.t.app.title.toUpperCase(), style: context.textOnDark.brandTitle),
                ],
              ),
            ),
            Divider(color: context.colors.onDarkDivider, height: KSize.borderWidthVerySmall),
            const SizedBox(height: KSize.margin2x),
            for (int i = 0; i < items.length; i++)
              _DrawerNavItem(
                item: items[i],
                selected: i == selectedIndex,
                onTap: () => onSelected(i),
              ),
            const Spacer(),
            Divider(color: context.colors.onDarkDivider, height: KSize.borderWidthVerySmall),
            Padding(
              padding: const EdgeInsets.all(KSize.margin6x),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: context.colors.forestGreen,
                  textTheme: Theme.of(context).textTheme.apply(bodyColor: context.colors.onDark),
                  iconTheme: IconThemeData(color: context.colors.onDark),
                ),
                child: const LanguageSwitcher(),
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

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: KSize.margin6x, vertical: KSize.margin5x),
        color: selected ? colors.onDarkOverlay : Colors.transparent,
        child: Row(
          children: [
            Icon(
              item.icon,
              color: selected ? colors.onDark : colors.onDarkMuted,
              size: KSize.iconSMedium,
            ),
            const SizedBox(width: KSize.margin4x),
            Text(
              item.label,
              style: selected ? context.textOnDark.drawerItem : context.textOnDarkDim.drawerItem,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Gallery footer ───────────────────────────────────────────────────────────

class _GalleryFooter extends StatelessWidget {
  const _GalleryFooter({required this.items, required this.onSelected, this.compact = false});

  final List<_NavItem> items;
  final ValueChanged<int> onSelected;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return compact ? _buildCompact(context) : _buildFull(context);
  }

  Widget _buildFull(BuildContext context) {
    return Container(
      color: context.colors.darkOlive,
      padding: const EdgeInsets.symmetric(horizontal: KSize.margin12x, vertical: KSize.margin3x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _GalleryLogo(size: KSize.logoSizeCompact),
          const SizedBox(width: KSize.margin3x),
          Text(context.t.app.title.toUpperCase(), style: context.textOnDark.footerBrand),
          const SizedBox(width: KSize.margin8x),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: KSize.margin5x,
              runSpacing: KSize.margin1x,
              children: [
                for (int i = 0; i < items.length; i++)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => onSelected(i),
                      child: Text(items[i].label, style: context.textOnDark.footerLink),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: KSize.margin8x),
          Text(
            '© ${DateTime.now().year} ${context.t.app.title}',
            style: context.textOnDark.footerCopyright,
          ),
        ],
      ),
    );
  }

  Widget _buildCompact(BuildContext context) {
    return Container(
      color: context.colors.darkOlive,
      padding: const EdgeInsets.symmetric(horizontal: KSize.margin6x, vertical: KSize.margin4x),
      child: Center(
        child: Text(
          '© ${DateTime.now().year} ${context.t.app.title}',
          style: context.textOnDark.footerCopyright,
        ),
      ),
    );
  }
}

// ─── Nav item data ────────────────────────────────────────────────────────────

class _NavItem {
  const _NavItem({required this.label, required this.location, required this.icon});

  final String label;
  final String location;
  final IconData icon;
}
