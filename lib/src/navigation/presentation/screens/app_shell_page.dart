import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/app_theme.dart';
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
      body: SelectionArea(
        child: Column(
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
      body: SelectionArea(
        child: Column(
          children: [
            Expanded(child: child),
            _GalleryFooter(
              items: items,
              onSelected: (i) => context.go(items[i].location),
              compact: true,
            ),
          ],
        ),
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
    final contactsIndex = items.indexWhere((e) => e.location == '/contacts');
    final navItems = items.where((e) => e.location != '/contacts').toList();

    return Container(
      color: AppTheme.forestGreen,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSize.margin12x),
        child: Row(
          children: [
            // Logo + gallery name
            GestureDetector(
              onTap: () => onSelected(0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Row(
                  children: [
                    const _GalleryLogo(size: 40),
                    const SizedBox(width: KSize.margin4x),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.t.app.title.toUpperCase(),
                          style: context.textOnDark.brandTitle,
                        ),
                        Text('Collection of Fine Arts', style: context.textOnDark.brandSubtitle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Navigation links (all except contacts)
            for (final item in navItems)
              _HeaderNavItem(
                label: item.label,
                selected: items.indexOf(item) == selectedIndex,
                onTap: () => onSelected(items.indexOf(item)),
              ),
            const Spacer(),
            // Contacts CTA button
            if (contactsIndex >= 0)
              _ContactsButton(
                label: items[contactsIndex].label,
                selected: selectedIndex == contactsIndex,
                onTap: () => onSelected(contactsIndex),
              ),
            const SizedBox(width: KSize.margin6x),
            // Language switcher themed for dark background
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppTheme.forestGreen,
                textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.onDark),
                iconTheme: const IconThemeData(color: AppColors.onDark),
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
  const _HeaderNavItem({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(right: KSize.margin8x),
          padding: const EdgeInsets.symmetric(vertical: KSize.margin3x, horizontal: KSize.margin2x),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? AppColors.onDark : Colors.transparent,
                width: 1.5,
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
  const _ContactsButton({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin6x, vertical: KSize.margin3x),
          decoration: BoxDecoration(
            color: selected ? AppColors.onDarkDivider : Colors.transparent,
            border: Border.all(color: AppColors.onDarkMuted, width: 1),
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
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.onDarkSubtle, width: 1),
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
      backgroundColor: AppTheme.forestGreen,
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
            const Divider(color: AppColors.onDarkDivider, height: 1),
            const SizedBox(height: KSize.margin2x),
            for (int i = 0; i < items.length; i++)
              _DrawerNavItem(
                item: items[i],
                selected: i == selectedIndex,
                onTap: () => onSelected(i),
              ),
            const Spacer(),
            const Divider(color: AppColors.onDarkDivider, height: 1),
            Padding(
              padding: const EdgeInsets.all(KSize.margin6x),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: AppTheme.forestGreen,
                  textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.onDark),
                  iconTheme: const IconThemeData(color: AppColors.onDark),
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
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: KSize.margin6x, vertical: KSize.margin5x),
        color: selected ? AppColors.onDarkOverlay : Colors.transparent,
        child: Row(
          children: [
            Icon(item.icon, color: selected ? AppColors.onDark : AppColors.onDarkMuted, size: 18),
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
      color: AppTheme.darkOlive,
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
            color: Colors.black12,
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
      color: AppTheme.darkOlive,
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
