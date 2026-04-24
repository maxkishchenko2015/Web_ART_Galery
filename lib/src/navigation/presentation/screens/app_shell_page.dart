import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/language_switcher.dart';

class AppShellPage extends StatelessWidget {
  const AppShellPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final currentPath = GoRouterState.of(context).uri.path;
    final items = _buildNavItems(context);
    final selectedIndex = _selectedIndex(items, currentPath);

    if (width < KSize.adaptiveCompactBreakpoint) {
      return _MobileShell(items: items, selectedIndex: selectedIndex, child: child);
    }
    return _DesktopShell(items: items, selectedIndex: selectedIndex, child: child);
  }

  List<_NavItem> _buildNavItems(BuildContext context) => [
    _NavItem(
      label: context.t.navigation.aboutAuthor,
      location: '/about-author',
      icon: Icons.person_outline,
    ),
    _NavItem(label: context.t.navigation.news, location: '/news', icon: Icons.newspaper_outlined),
    _NavItem(
      label: context.t.navigation.catalogOfWorks,
      location: '/catalog',
      icon: Icons.collections_bookmark_outlined,
    ),
    _NavItem(
      label: context.t.navigation.archive,
      location: '/archive',
      icon: Icons.archive_outlined,
    ),
    _NavItem(
      label: context.t.navigation.contacts,
      location: '/contacts',
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
                constraints: const BoxConstraints(maxWidth: 1420),
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
        toolbarHeight: 64,
        title: Row(
          children: [
            const _GalleryLogo(size: 32),
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

  static const double _compactDesktopHeaderBreakpoint = 1180;

  final List<_NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMediumWidth = width < _compactDesktopHeaderBreakpoint;
    final contactsIndex = items.indexWhere((e) => e.location == '/contacts');
    final navItems = items.where((e) => e.location != '/contacts').toList();

    return Container(
      color: context.colors.forestGreen,
      height: 80,
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
                    _GalleryLogo(size: isMediumWidth ? 32 : 40),
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
                          Text('Collection of Fine Arts', style: context.textOnDark.brandSubtitle),
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
  const _GalleryLogo({this.size = 40});

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
        child: Builder(builder: (context) => Text('KA', style: context.textOnDark.logoMark(size))),
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
                  const _GalleryLogo(size: 40),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KSize.margin12x,
              vertical: KSize.margin4x,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const _GalleryLogo(size: 28),
                      const SizedBox(width: KSize.margin3x),
                      Text(
                        context.t.app.title.toUpperCase(),
                        style: context.textOnDark.footerBrand,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: KSize.margin12x),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SITEMAP', style: context.textOnDark.footerSitemapLabel),
                      const SizedBox(height: KSize.margin3x),
                      for (int i = 0; i < items.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: KSize.margin2x),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => onSelected(i),
                              child: Text(items[i].label, style: context.textOnDark.footerLink),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: context.colors.footerOverlay,
            padding: const EdgeInsets.symmetric(
              horizontal: KSize.margin12x,
              vertical: KSize.margin4x,
            ),
            child: Row(
              children: [
                Text(
                  '© ${DateTime.now().year} ${context.t.app.title}. All rights reserved.',
                  style: context.textOnDark.footerCopyright,
                ),
              ],
            ),
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
